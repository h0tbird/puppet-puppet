#------------------------------------------------------------------------------
# Class: puppet::server::install
#
#   This class is part of the puppet module.
#   You should not be calling this class.
#   The delegated class is Class['puppet::server'].
#
#   Marc Villacorta <marc.villacorta@gmail.com>
#   2012-07-17
#
#------------------------------------------------------------------------------
class puppet::server::install {

    # Collect variables:
    $version  = getvar("${module_name}::server::version")
    $packages = getvar("${module_name}::server::params::packages")

    # Install the package/s:
    package { $packages: ensure => $version }
}
