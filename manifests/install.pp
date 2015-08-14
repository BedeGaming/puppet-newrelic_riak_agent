class newrelic_riak_agent::install (
  $installdir      = $newrelic_riak_agent::installdir,
  $initscript      = $newrelic_riak_agent::initscript,
  $plugin_source   = $newrelic_riak_agent::plugin_source,
  $initscript_src  = $newrelic_riak_agent::initscript_src,
) {

  file { [$installdir, "${installdir}/config"]:
    ensure  => 'directory',
  }

  file { "${installdir}/riak_agent.rb":
    ensure  => 'present',
    mode    => '0755',
    content => template($plugin_source),
    require => File[$installdir],
  }

  file { $initscript :
    ensure  => 'present',
    mode    => '0755',
    source  => $initscript_src,
    require => File["${installdir}/riak_agent.rb"],
  }
}
