class zookeeper {
  $version = "3.9.1"
  $download_url = "https://downloads.apache.org/zookeeper/zookeeper-${version}/apache-zookeeper-${version}-bin.tar.gz"
  $install_dir = "/usr/lib/zookeeper"

  exec { 'download_and_extract_zookeeper':
    command     => "curl -L ${download_url} | tar -xz -C ${install_dir} --strip-components=1",
    path        => ['/usr/bin', '/usr/sbin'],
    cwd         => '/tmp',
    creates     => "${install_dir}/bin/zkServer.sh start",
    #require     => Package['curl'],
    #before      => Class['zookeeper::config'],
  }

  package { 'curl':
    ensure => installed,
  }

  # class { 'zookeeper::config':
  #   install_dir => $install_dir,
  # }
}
