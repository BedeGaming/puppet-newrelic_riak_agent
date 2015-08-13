class newrelic_riak_agent::params {

  case $::osfamily {
    'redhat': {
      $license_key    = undef
      $port           = 8098
      $conf_template  = 'newrelic_riak_agent/newrelic_plugin.yml.erb'
      $plugin_source  = 'newrelic_riak_agent/riak_agent.rb'
      $installdir     = '/opt/newrelic-riak-agent'
      $verbose_output = 0
      $service_ensure = 'running'
      $service_enable = true
      $initscript     = '/etc/systemd/system/newrelic-riak-agent.service'
      $initscript_src = 'puppet:///modules/newrelic_riak_agent/newrelic-riak-agent.service'
    }

    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }

}
