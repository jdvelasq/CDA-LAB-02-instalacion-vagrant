package {['Sphinx',
          'sphinx_rtd_theme',
          'nbsphinx']:
    ensure   => present,
    provider => 'pip3',
}

package {['pandoc']:
    ensure => present,
}

exec { 'github-docs':
    command => '/bin/mkdir /vagrant/docs', 
    timeout => 0,
    onlyif  => '/usr/bin/test ! -d /vagrant/docs'
}

