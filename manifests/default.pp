group{ 'puppet': ensure  => present }

node 'cassandra.local' {
  include cassandra
}
