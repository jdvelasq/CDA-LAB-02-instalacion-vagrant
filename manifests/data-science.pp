
##
## Librerias del sistema operativo
##

#
# sudo mv /var/lib/dpkg/info/install-info.postinst /var/lib/dpkg/info/install-info.postinst.bad
#


##
##
##  OpenRefine
##
##
#exec { 'openrefine-download':
#    command => '/usr/bin/wget -P /vagrant/resources/ https://github.com/OpenRefine/OpenRefine/releases/download/3.1/openrefine-linux-3.1.tar.gz',
#    timeout => 0,
#    onlyif  => '/usr/bin/test ! -f /vagrant/resources/openrefine-linux-3.1.tar.gz'
#}

#exec { 'openrefine-mv':
#    command => '/bin/tar -xzf /vagrant/resources/openrefine-linux-3.1.tar.gz && /bin/mv openrefine-3.1 /usr/local/openrefine-3.1', 
#    timeout => 0,
#    onlyif  => '/usr/bin/test ! -d /usr/local/openrefine-3.1' 
#}


##
##
## node.js
##
##
#exec { 'nodejs-repo':
#command => '/usr/bin/curl -sL https://deb.nodesource.com/setup_11.x | /usr/bin/sudo /bin/bash -',
#timeout => 0,
#}

##
##
## Paquetes
##
##  
package {[
    #
    # Sistema
    #
    'build-essential',
    'csvkit',
    'gcc',
    'libcurl4-openssl-dev', 
    'libffi-dev',
    'libldap2-dev',
    'libsasl2-dev',
    'libssl-dev',
    'libxml2-dev',
    'libzmq3-dev', 
    'pandoc',
    'tree',
    #
    # MySQL
    #
    'mysql-server',
    #
    # nodejs
    #
    'nodejs',
    #
    # Python
    #
    'python-dev',
    'python-pip',
    'python-virtualenv',
    'python3-minimal',
    'python3-pip',
    #
    # R
    #
    'r-base'
    ]:
ensure => present,
}



##
##
## Paquetes de Python
##    
##
package {[
    'sqlalchemy==1.2.18',
    'pandas==0.23.4',
    'bash_kernel',
    #
    # Sphinx
    #
#    'sphinx',
#    'sphinx_rtd_theme',
#    'nbsphinx',
    #
    # SQL
    #
    'ipython-sql',
    'pymysql',
    #
    # Apache superset
    #
#    'superset',
    #
    # Jupyter & Jupyter Lab
    #
    'jupyter',
    'jupyterlab',
    'jupyter-core',
    'jupyter-client',
    'ipython',
    'jupyterlab-dash==0.1.0a2',
    'ipywidgets',
    'ipysheet',
    'pylantern',
    #
    #
    #
    'numpy',
    'scipy',
    'scikit-learn',
    'statsmodels',
    'matplotlib',
    'seaborn',
    'altair',
    'vega_datasets',
    'vega',
    'tzlocal',
    'wordcloud',
    'rpy2',
    #
    # Redes neuronales
    #
    'tensorflow',
    'jupyter-tensorboard',
    'keras',
    'theano'
    ]:
ensure   => present,
    provider => 'pip3',
}

##
## 
##  Cartopy & GeoPandas
##
##
package {[
    #
    # Sistema
    #
    'libproj-dev',
    'proj-data',
    'proj-bin',
    'libgeos-dev',
    'libgeos-c1v5'
    ]:
ensure => present,
}


package {[
    'six',
    'pyshp',
    'shapely',
    'Cython',
    'cartopy',
    'geopandas',
    'geoplot'
    ]:
ensure   => present,
    provider => 'pip3',
}



##
##
## jupyter labextension list
##
##
exec { 'jupyterlab-github':
    command => '/usr/local/bin/jupyter labextension install @jupyterlab/github',
    onlyif  => '/usr/bin/test ! -f /usr/local/share/jupyter/lab/extensions/jupyterlab-github-0.10.0.tgz'
    }

exec { 'jupyterlab-toc':
    command => '/usr/local/bin/jupyter labextension install @jupyterlab/toc',
    onlyif  => '/usr/bin/test ! -f /usr/local/share/jupyter/lab/extensions/jupyterlab-toc-0.6.0.tgz'
    }

exec { 'jupyterlab-bokeh':
    command => '/usr/local/bin/jupyter labextension install jupyterlab_bokeh',
    onlyif  => '/usr/bin/test ! -f /usr/local/share/jupyter/lab/extensions/jupyterlab_bokeh-0.6.3.tgz'
    }

exec { 'jupyterlab-fasta':
    command => '/usr/local/bin/jupyter labextension install @jupyterlab/fasta-extension',
    onlyif  => '/usr/bin/test ! -f /usr/local/share/jupyter/lab/extensions/jupyterlab-fasta-extension-0.18.1.tgz'
    }

exec { 'jupyterlab-geojson':
    command => '/usr/local/bin/jupyter labextension install @jupyterlab/geojson-extension',
    onlyif  => '/usr/bin/test ! -f /usr/local/share/jupyter/lab/extensions/jupyterlab-geojson-extension-0.18.1.tgz'
    }

exec { 'jupyterlab-katex':
    command => '/usr/local/bin/jupyter labextension install @jupyterlab/katex-extension',
    onlyif  => '/usr/bin/test ! -f /usr/local/share/jupyter/lab/extensions/jupyterlab-katex-extension-0.20.1.tgz'
    }

exec { 'jupyterlab-mathjax3':
    command => '/usr/local/bin/jupyter labextension install @jupyterlab/mathjax3-extension',
    onlyif  => '/usr/bin/test ! -f /usr/local/share/jupyter/lab/extensions/jupyterlab-mathjax3-extension-0.3.1.tgz'
    }

exec { 'jupyterlab-plotly':
    command => '/usr/local/bin/jupyter labextension install @jupyterlab/plotly-extension',
    onlyif  => '/usr/bin/test ! -f /usr/local/share/jupyter/lab/extensions/jupyterlab-plotly-extension-0.18.2.tgz'
    }

exec { 'jupyterlab-vega2':
    command => '/usr/local/bin/jupyter labextension install @jupyterlab/vega2-extension',
    onlyif  => '/usr/bin/test ! -f /usr/local/share/jupyter/lab/extensions/jupyterlab-vega2-extension-0.18.1.tgz'
    }

exec { 'jupyterlab-vega3':
    command => '/usr/local/bin/jupyter labextension install @jupyterlab/vega3-extension',
    onlyif  => '/usr/bin/test ! -f /usr/local/share/jupyter/lab/extensions/jupyterlab-vega3-extension-0.18.1.tgz'
    }

exec { 'jupyterlab-vega4':
    command => '/usr/local/bin/jupyter labextension install @jupyterlab/vega4-extension',
    onlyif  => '/usr/bin/test ! -f /usr/local/share/jupyter/lab/extensions/jupyterlab_bokeh-0.6.3.tg'
    }

exec { 'jupyterlab-manager':
    command => '/usr/local/bin/jupyter labextension install @jupyter-widgets/jupyterlab-manager',
    onlyif  => '/usr/bin/test ! -f /usr/local/share/jupyter/lab/extensions/jupyter-widgets-jupyterlab-manager-0.38.1.tgz'
    }

exec { 'jupyterlab-voyager':
    command => '/usr/local/bin/jupyter labextension install jupyterlab_voyager',
    onlyif  => '/usr/bin/test ! -f /usr/local/share/jupyter/lab/extensions/jupyterlab_voyager-1.0.1.tgz'
    }

exec { 'jupyterlab-dash':
    command => '/usr/local/bin/jupyter labextension install jupyterlab-dash@0.1.0-alpha.2',
    onlyif  => '/usr/bin/test ! -f /usr/local/share/jupyter/lab/extensions/jupyterlab-dash-0.1.0-alpha.2.tgz'
    }

exec { 'jupyterlab-ipysheet':
    command => '/usr/local/bin/jupyter labextension install ipysheet',
    onlyif  => '/usr/bin/test ! -f /usr/local/share/jupyter/lab/extensions/ipysheet-0.4.2.tgz'
    }

exec { 'jupyterlab-pylantern':
    command => '/usr/local/bin/jupyter labextension install pylantern',
    onlyif  => '/usr/bin/test ! -f /usr/local/share/jupyter/lab/extensions/pylantern-0.1.1.tgz'
    }

exec { 'jupyterlab-drawio':
    command => '/usr/local/bin/jupyter labextension install jupyterlab-drawio',
    onlyif  => '/usr/bin/test ! -f /usr/local/share/jupyter/lab/extensions/jupyterlab-drawio-0.5.0.tgz'
    }

exec { 'jupyterlab-tensorboard':
    command => '/usr/local/bin/jupyter labextension install jupyterlab_tensorboard',
    onlyif  => '/usr/bin/test ! -f /usr/local/share/jupyter/lab/extensions/jupyterlab_tensorboard-0.1.5.tgz'
}

##
##
## Scrips del sistema
##
##

#
# Bash kernel
#
exec { 'bash-kernel':
    command => '/usr/bin/python3 -m bash_kernel.install',
    onlyif  => '/usr/bin/test ! -d /usr/local/share/jupyter/kernels/bash'
    }

#
# MySQL
#
file { '/etc/mysql/mysql.conf.d/mysqld.cnf':
  ensure => present,
    }->
    file_line { 'config line':
    path => '/etc/mysql/mysql.conf.d/mysqld.cnf',  
    line => 'secure_file_priv=""',
}


#
# R Scripts
#

file { '/home/vagrant/IRscript.R':
    content => "
        install.packages(
            c('repr', 'IRdisplay', 'IRkernel'), 
            type = 'source')
        IRkernel::installspec(user=FALSE)
        "
    }

exec { 'IRkernel':
    command => '/usr/bin/Rscript /home/vagrant/IRscript.R && /bin/rm /home/vagrant/IRscript.R',
    user    => 'root',
    onlyif  => '/usr/bin/test ! -d /usr/local/share/jupyter/kernels/ir'
}

file { '/home/vagrant/tensorflow.R':
    content => "
        install.packages(
            c('devtools'))
        devtools::install_github('rstudio/tensorflow')
        library(tensorflow)
        install_tensorflow()
        "
}

exec { 'tensorflow-R':
    command => '/usr/bin/Rscript /home/vagrant/tensorflow.R && /bin/rm /home/vagrant/tensorflow.R',
    user    => 'root',
    onlyif  => '/usr/bin/test ! -d /usr/local/lib/R/site-library/tensorflow',
    timeout => 0,
}



  #
  # exec { 'julia-download':
  #   command => '/usr/bin/wget -P /vagrant/resources/ https://julialang-s3.julialang.org/bin/linux/x64/1.1/julia-1.1.0-linux-x86_64.tar.gz',
  #   timeout => 0,
  #   onlyif  => '/usr/bin/test ! -f /vagrant/resources/julia-1.1.0-linux-x86_64.tar.gz'
  # }
  # 
  # exec { 'julia-mv':
  #   command => '/bin/tar -xzf /vagrant/resources/julia-1.1.0-linux-x86_64.tar.gz && /bin/mv julia-1.1.0 /usr/local/julia-1.1.0', 
  #   timeout => 0,
  #   onlyif  => '/usr/bin/test ! -d /usr/local/julia-1.1.0'
  # }
  #
  # file { '/home/vagrant/ijulia.jl':
  #   content => 'using Pkg
  #   Pkg.add("IJulia")'
  # }
  # 
  # exec { 'ijulia-kernel':
  #    command => '/usr/bin/sudo /usr/local/julia-1.1.0/bin/julia ijulia.jl',
  #    timeout => 0,
  #    onlyif  => '/usr/bin/test ! -d /home/vagrant/.local/share/jupyter/kernels/julia-1.1'
  # }
  #
  #
  # package {['ruby-full']:
  #   ensure => present,
  # }
  # 
  # exec { 'ruby-kernel':,
  #    command => '/usr/bin/sudo /usr/bin/gem install cztop iruby && iruby register --force',
  #    user    => 'root',
  #    onlyif  => '/usr/bin/test ! -d /home/vagrant/.ipython/kernels/ruby'
  # }
  #



      
