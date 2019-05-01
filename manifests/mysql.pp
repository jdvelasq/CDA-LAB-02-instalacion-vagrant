package {['mysql-server']:
    ensure => present,
}

package {['ipython-sql',
          'pymysql'
          'SQLAlchemy']:
    ensure   => present,
    provider => 'pip3',
}

file { '/etc/mysql/mysql.conf.d/mysqld.cnf':
  ensure => present,
}->
file_line { 'config line':
  path => '/etc/mysql/mysql.conf.d/mysqld.cnf',  
  line => 'secure_file_priv=""',
}