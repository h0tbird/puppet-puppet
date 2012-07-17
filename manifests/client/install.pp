#------------------------------------------------------------------------------
# Class: puppet::client::install
#
#   This class is part of the puppet module.
#   You should not be calling this class.
#   The delegated class is Class['puppet::client'].
#
#   Marc Villacorta <marc.villacorta@gmail.com>
#   2012-07-17
#
#------------------------------------------------------------------------------
class puppet::client::install {

    # Collect variables:
    $version  = getvar("${module_name}::client::version")
    $packages = getvar("${module_name}::client::params::packages")

    # Install the package/s:
    package { $packages: ensure => $version }
}
