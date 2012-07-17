#------------------------------------------------------------------------------
# Class: puppet::client::params
#
#   This class is part of the puppet module.
#   You should not be calling this class.
#   The delegated class is Class['puppet::client'].
#
#   Marc Villacorta <marc.villacorta@gmail.com>
#   2012-07-17
#
#------------------------------------------------------------------------------
class puppet::client::params {

    # Set location for files and templates:
    $files     = "puppet:///modules/${module_name}/${operatingsystem}"
    $templates = "${module_name}/${operatingsystem}"

    # Set OS specifics:
    case $osfamily {

        'RedHat': {
            $packages = ['puppet','facter']
            $configs  = ['/etc/puppet/puppet.conf','/etc/puppet/auth.conf']
            $services = ['puppet']
        }

        default: { fail("${module_name}::client::params ${osfamily} family is not supported yet.") }
    }
}
