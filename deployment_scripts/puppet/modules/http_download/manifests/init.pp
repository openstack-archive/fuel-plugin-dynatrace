# Class: http_download
#
class http_download {
  # this is just a test for the module
  if $::kernel == 'linux' {
    $target = '/tmp/'
  } else {
    $target = 'C:/'
  }

  download { 'test file basic':
    uri  => 'http://www.7-zip.org/a/7z920-x64.msi',
    dest => "${target}7z920-x64.msi",
  }

  download { 'test https and large file':
    uri  => 'https://downloads.mariadb.org/f/mariadb-10.1.10/source/mariadb-10.1.10.tar.gz?serve',
    dest => "${target}mariadb-10.1.10.tar.gz",
  }
  
  download { 'test force false':
    uri   => 'https://downloads.mariadb.org/f/mariadb-10.1.10/source/mariadb-10.1.10.tar.gz?serve',
    dest  => "${target}mariadb-10.1.10.tar.gz",
    force => false
  }

  download { 'test basic auth':
    uri  => 'http://brunmayr.org/test/README.md',
    dest => "${target}README.md",
    user => 'test',
    pass => 'Basic_Auth1'
  }
}
