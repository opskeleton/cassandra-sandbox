# cassandra setup
class cassandra {

  include apt

  class{'jdk':
    version => 7
  }

  apt::key { 'datastax-key':
    key        => 'B999A372',
    key_source => 'http://debian.datastax.com/debian/repo_key',
  } ->

  apt::source { 'cassandra':
    location    => 'http://debian.datastax.com/community',
    release     => 'stable',
    repos       => 'main',
    include_src => false,
  } ->

  package{'dsc20':
    ensure  => present,
    require   => Class['jdk']
  } ->

  service{'cassandra':
    ensure    => running,
    enable    => true,
    hasstatus => true,
  }

}
