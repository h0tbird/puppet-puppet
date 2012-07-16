#------------------------------------------------------------------------------
# Class: puppet::master
#
#   This class is part of the puppet module.
#
#   Marc Villacorta <marc.villacorta@gmail.com>
#   2012-07-16
#
#------------------------------------------------------------------------------
class puppet::master {

    include puppet

    Class['puppet'] -> Class['puppet::master']

    Package <| title == 'puppet' |> { name +> 'puppet-server' }
    Service <| title == 'puppet' |> { name +> 'puppetmaster' }

    Host <| title == 'localhost' |> { host_aliases +> ['puppet', "puppet.${::domain}"] }
    Host <| title == 'puppet' |> { ensure => absent }
}
