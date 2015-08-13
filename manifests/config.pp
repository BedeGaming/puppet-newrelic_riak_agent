class newrelic_riak_agent::config (

  $installdir     = $newrelic_riak_agent::installdir,
  $conf_template  = $newrelic_riak_agent::conf_template,

) {

  file { "${installdir}/config/newrelic_plugin.yml":
    ensure  => file,
    content => template($conf_template)
    mode    => '0644',
    require => File["${installdir}/config"]
  }
}
