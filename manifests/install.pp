class newrelic_riak_agent::install (
  $installdir      = $newrelic_riak_agent::installdir,
  $initscript      = $newrelic_riak_agent::initscript,
  $initscript_src  = $newrelic_riak_agent::initscript_src,
  $agentscript_src = $newrelic_riak_agent::agentscript_src,
) {

  package { 'newrelic_plugin':
    ensure   => installed,
    provider => 'gem',
  }

  package { 'rest-client':
    ensure   => installed,
    provider => 'gem',
  }

  package { 'json':
    ensure   => installed,
    provider => 'gem',
  }

  file { [$installdir, "${installdir}/config"]:
    ensure  => 'directory',
  }

  file { "${installdir}/riak_agent.rb":
    ensure  => 'present',
    source  => $agentscript_src,
    require => File[$installdir],
  }

  file { $initscript :
    ensure  => 'present',
    mode    => '0755',
    source  => $initscript_src,
    require => File["${installdir}/riak_agent.rb"],
  }
}
