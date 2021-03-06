#------------------------------------------------------------------------------
# Class: puppet::server::service
#
#   This class is part of the puppet module.
#   You should not be calling this class.
#   The delegated class is Class['puppet::server'].
#
#   Marc Villacorta <marc.villacorta@gmail.com>
#   2012-07-17
#
#------------------------------------------------------------------------------
class puppet::server::service {

    # Collect variables:
    $ensure   = getvar("${module_name}::server::ensure")
    $services = getvar("${module_name}::server::params::services")

    # Start or stop the service:
    service { $services:
        ensure  => $ensure,
        enable  => $ensure ? {
            'running' => true,
            'stopped' => false,
        }
    }
}
