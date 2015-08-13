class newrelic_riak_agent (
  $license_key    = $newrelic_riak_agent::params::license_key,
  $conf_template  = $newrelic_riak_agent::params::conf_template,
  $plugin_source  = $newrelic_riak_agent::params::plugin_source,
  $installdir     = $newrelic_riak_agent::params::installdir,
  $loglevel       = $newrelic_riak_agent::params::loglevel,
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
