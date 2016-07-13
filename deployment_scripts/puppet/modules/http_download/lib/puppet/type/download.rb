# This type holds the code to upload the user attributes
#
#
require 'puppet'
require 'puppet/parameter/boolean'

Puppet::Type.newtype(:download) do
  desc <<-EOS
    This type allows to do downloads via ruby without the need for any localy provided executable.
   
    Example usage:
  
      Download a file:
        
        download { 'my download':
          uri  => 'http://www.example.com/download/example.txt',
          dest => '/tmp/example.txt'
        }
          
      Download file only if no local file exists:
        
        download { 'my download':
          uri   => 'http://www.example.com/download/example.txt',
          dest  => '/tmp/example.txt',
          force => false
        }
          
      Download file using basic authentication:    
        
        download { 'my ssl and basic auth download':
          uri  => 'https://www.example.com/download/example.txt',
          dest => '/tmp/example.txt',
          user => 'user',
          pass => 'pass'
        }

      Download file using proxy settings:

        download { 'my download behind a proxy':
          uri         => 'https://www.example.com/download/example.txt',
          dest        => '/tmp/example.txt',
          proxy_host  => '127.0.0.1',
          proxy_port  => '3128',
          proxy_user  => 'user', # optionnal: only if proxy need authentication 
          proxy_pass  => 'pass' # optionnal: only if proxy need authentication 
        }
  EOS

  ensurable do
    defaultvalues
    defaultto :present
  end

  newparam(:name, :namevar => true) do
    desc "The name for the download."
  end

  newparam(:uri) do
    desc "The uri of the file to download."
  end

  newparam(:dest) do
    desc "The destination file. Make sure the path to this file exists!"
  end
  
  newparam(:force, :boolean => true, :parent => Puppet::Parameter::Boolean) do
    desc <<-EOS
      Per default a file download will be forced as there is no good way to check if the local file 
      matches the download. If you only want to ensure that a file with that name exists locally you
      can set this to false.
    EOS
    defaultto :true
    newvalues(:true, :false)
  end

  newparam(:use_ssl, :boolean => true, :parent => Puppet::Parameter::Boolean) do
    desc "Use SSL for the transfer? If the URL starts with https this is set automatically."
    defaultto :false
    newvalues(:true, :false)
  end

  newparam(:user) do
    desc "A user to use for basic authentication."
  end

  newparam(:pass) do
    desc "A pass to use for basic authentication."
  end

  newparam(:proxy_host) do
    desc "The proxy hostname. Make sure the host exists!"
  end

  newparam(:proxy_port) do
    desc "The proxy port. Make sure the port is open!"
  end


  newparam(:proxy_user) do
    desc "The proxy username. This is an optional parameter"
  end

  newparam(:proxy_pass) do
    desc "The proxy password. This is an optional parameter"
  end

end