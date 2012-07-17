#------------------------------------------------------------------------------
# Class: puppet::client::config
#
#   This class is part of the puppet module.
#   You should not be calling this class.
#   The delegated class is Class['puppet::client'].
#
#   Marc Villacorta <marc.villacorta@gmail.com>
#   2012-07-17
#
#------------------------------------------------------------------------------
class puppet::client::config {

    # Collect variables:
    $templates = getvar("${module_name}::client::params::templates")
    $configs   = getvar("${module_name}::client::params::configs")

    # Install the configuration files:
    file {

        $configs[0]:
            ensure  => present,
            content => template("${templates}/puppet.conf.erb");

        $configs[1]:
            ensure  => present,
            content => template("${templates}/auth.conf.erb");
    }
}
