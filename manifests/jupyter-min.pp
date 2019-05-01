##
## Python
##    Configuración mínima
##
package {['python3-pip']:
    ensure => present,
}

package {['jupyter',
          'jupyterlab']:
    ensure   => present,
    provider => 'pip3',
}
