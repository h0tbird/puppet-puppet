#------------------------------------------------------------------------------
# Class: puppet::server
#
#   This module manages the puppet master service.
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
#       Installs, configures and manages the puppet master service.
#
#   Sample Usage:
#
#       include puppet::server
#
#       or
#
#       class { 'puppet::server': }
#
#       or
#
#       class { 'puppet::server':
#           ensure  => running,
#           version => present,
#       }
#
#------------------------------------------------------------------------------
class puppet::server (

    $ensure  = running,
    $version = present

) {

    # Validate parameters:
    validate_re($ensure, '^running$|^stopped$')
    validate_re($version, '^present$|^latest$')

    # Register this module:
    if defined(Class['motd']) { motd::register { "${module_name}master": } }

    # Set the requirements:
    anchor { "${module_name}::server::begin":   } ->
    class  { "${module_name}::server::params":  } ->
    class  { "${module_name}::server::install": } ->
    class  { "${module_name}::server::config":  } ~>
    class  { "${module_name}::server::service": } ->
    anchor { "${module_name}::server::end":     }
}
