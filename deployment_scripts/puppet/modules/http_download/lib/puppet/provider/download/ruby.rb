# This type allows dowloads of files via plain ruby
#
require 'puppet'
require 'net/http'
require 'uri'

Puppet::Type.type(:download).provide(:ruby) do
  def fetch(uri_str, limit = 10)
    raise ArgumentError, 'Too many HTTP redirects' if limit == 0
    uri = URI(uri_str)
    

    if resource[:proxy_host] and resource[:proxy_port]
      if resource[:proxy_user] and resource[:proxy_pass]
        http = Net::HTTP.new(uri.host, uri.port, resource[:proxy_host], resource[:proxy_port], resource[:proxy_user], resource[:proxy_pass])
      else
        http = Net::HTTP.new(uri.host, uri.port, resource[:proxy_host], resource[:proxy_port])
      end
    else
      http = Net::HTTP.new(uri.host, uri.port)
    end

    begin
      if resource[:use_ssl] or uri_str.start_with? 'https'
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end
      request = Net::HTTP::Get.new uri.request_uri
      if nil != resource[:user] and nil != resource[:pass]
        request.basic_auth(resource[:user], resource[:pass])
      end
      http.request request do |response|
        case response
        when Net::HTTPRedirection then
          location = response['location']
          Puppet.notice("redirected to #{location}")
          fetch(location, limit - 1)
        when Net::HTTPForbidden then
          raise SecurityError, 'Access denied'
        when Net::HTTPNotFound then
          raise ArgumentError, 'Not found'
        when Net::HTTPSuccess then
          open resource[:dest], 'wb' do |io|
            response.read_body do |chunk|
              io.write chunk
            end
          end
        else
          raise "Unexpected state => #{response.code} - #{response.message}"
        end
      end
    rescue Net::HTTPError => e
      if nil != http and http.started?
        http.finish()
      end
      raise e
    end
  end

  def download
    success = false
    for retries in 1..3
      begin
        fetch(resource[:uri])
        success = true
        break
      rescue SecurityError => s
        Puppet.crit("SecurityError -> \n#{s.inspect}")
        break
      rescue ArgumentError => a
        Puppet.crit("ArgumentError -> \n#{a.inspect}")
        break
      rescue IOError => eio
        Puppet.crit("IO Exception during http download -> \n#{eio.inspect}")
      rescue Net::HTTPError => ehttp
        Puppet.crit("HTTP Exception during http download -> \n#{ehttp.inspect}")
      rescue StandardError => e
        Puppet.crit("Exception during http download -> \n#{e.inspect}")
      end
      sleep(5)
    end
    return success
  end

  def exists?
    (File.file?(resource[:dest]) and !resource[:force])
  end

  def destroy
    if File.file?(resource[:dest])
      File.delete(resource[:dest])
    end
    true
  end

  def create
    succ = download()
    if !succ
      Puppet.crit("HTTP download of '#{resource[:uri]}' failed!")
    end
    succ
  end
end