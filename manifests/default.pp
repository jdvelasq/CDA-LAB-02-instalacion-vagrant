##
## Ciencia de los Datos
##

package {['tree',
          'csvkit',
          'mysql-server',
          'r-base']:
    ensure => present,
}

##
## Los paquetes de Python listados abajo son instalados usando
##
##    pip3 install nombre-paquete
##
package {['jupyter',
          'jupyterlab',
          'pandas',
          'ipython-sql',
          'pymysql',
          'matplotlib',
          'SQLAlchemy',
          'bash_kernel']:
    ensure   => present,
    provider => 'pip3',
}

##
## Los siguientes comandos son ejecutados en la CLI
##
exec { 'bash-kernel':
    command => '/usr/bin/python3 -m bash_kernel.install',
    onlyif  => '/usr/bin/test ! -d /usr/local/share/jupyter/kernels/bash'
}


##
## Asegura que MySQL pueda recibir datos de cualquier directorio
## 
file { '/etc/mysql/mysql.conf.d/mysqld.cnf':
  ensure => present,
}->
file_line { 'config line':
  path => '/etc/mysql/mysql.conf.d/mysqld.cnf',  
  line => 'secure_file_priv=""',
}