#------------------------------------------------------------------------------
# Class: puppet::server::config
#
#   This class is part of the puppet module.
#   You should not be calling this class.
#   The delegated class is Class['puppet::server'].
#
#   Marc Villacorta <marc.villacorta@gmail.com>
#   2012-07-17
#
#------------------------------------------------------------------------------
class puppet::server::config {

    # Collect variables:
    $templates = getvar("${module_name}::server::params::templates")
    $configs   = getvar("${module_name}::server::params::configs")

    # Set host alias:
    Host <| title == 'localhost' |> { host_aliases +> ['puppet', "puppet.${::domain}"] }
    Host <| title == 'puppet' |> { ensure => absent }
}
