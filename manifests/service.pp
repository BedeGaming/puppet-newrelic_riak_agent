class newrelic_riak_agent::service (

  $service_ensure = $newrelic_riak_agent::service_ensure,
  $service_enable = $newrelic_riak_agent::service_enable,

) {

  service { 'newrelic-riak-agent':
    ensure => $service_ensure,
    enable => $service_enable,
  }
}
