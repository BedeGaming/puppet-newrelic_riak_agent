class newrelic_riak_agent (
  $license_key    = $newrelic_riak_agent::params::license_key,
  $port           = $newrelic_riak_agent::params::port,
  $conf_template  = $newrelic_riak_agent::params::conf_template,
  $plugin_source  = $newrelic_riak_agent::params::plugin_source,
  $installdir     = $newrelic_riak_agent::params::installdir,
  $verbose_output = $newrelic_riak_agent::params::verbose_output,
  $service_ensure = $newrelic_riak_agent::params::service_ensure,
  $service_enable = $newrelic_riak_agent::params::service_enable,
  $initscript     = $newrelic_riak_agent::params::initscript,
  $initscript_src = $newrelic_riak_agent::params::initscript_src,
) inherits newrelic_riak_agent::params {

  class { 'newrelic_riak_agent::install': } ->
  class { 'newrelic_riak_agent::config':  } ~>
  class { 'newrelic_riak_agent::service': } ->
  Class['newrelic_riak_agent']
}
