#------------------------------------------------------------------------------
# Class: puppet::client
#
#   This module manages the puppet client service.
#
#   Marc Villacorta <marc.villacorta@gmail.com>
#   2012-07-17
#
#   Tested platforms:
#       - CentOS 6
#
#   Parameters:
#
#       ensure:  [ running | stopped ]
#       version: [ present | latest' ]
#
#   Actions:
#
#       Installs, configures and manages the puppet client service.
#
#   Sample Usage:
#
#       include puppet::client
#
#       or
#
#       class { 'puppet::client': }
#
#       or
#
#       class { 'puppet::client':
#           ensure  => running,
#           version => present,
#       }
#
#------------------------------------------------------------------------------
class puppet::client (

    $ensure  = running,
    $version = present

) {

    # Validate parameters:
    validate_re($ensure, '^running$|^stopped$')
    validate_re($version, '^present$|^latest$')

    # Register this module:
    if defined(Class['motd']) { motd::register { $module_name: } }

    # Set the requirements:
    anchor { "${module_name}::client::begin":   } ->
    class  { "${module_name}::client::params":  } ->
    class  { "${module_name}::client::install": } ->
    class  { "${module_name}::client::config":  } ~>
    class  { "${module_name}::client::service": } ->
    anchor { "${module_name}::client::end":     }
}
