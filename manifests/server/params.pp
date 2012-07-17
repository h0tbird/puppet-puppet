#------------------------------------------------------------------------------
# Class: puppet::server::params
#
#   This class is part of the puppet module.
#   You should not be calling this class.
#   The delegated class is Class['puppet::server'].
#
#   Marc Villacorta <marc.villacorta@gmail.com>
#   2012-07-17
#
#------------------------------------------------------------------------------
class puppet::server::params {

    # Set location for files and templates:
    $files     = "puppet:///modules/${module_name}/${operatingsystem}"
    $templates = "${module_name}/${operatingsystem}"

    # Set OS specifics:
    case $osfamily {

        'RedHat': {
            $packages = ['puppet-server']
            $services = ['puppetmaster']
        }

        default: { fail("${module_name}::server::params ${osfamily} family is not supported yet.") }
    }
}
