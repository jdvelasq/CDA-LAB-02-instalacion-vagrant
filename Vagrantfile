Vagrant.configure("2") do |config|
  
  ##
  ##
  ##  Puppet
  ##
  ##
  config.vm.box = "ubuntu/bionic64"

  ##
  ## se debe ejecutar en el prompt
  ##
  ##    vagrant plugin install vagrant-disksize
  ##
  config.disksize.size = '20GB'

  config.vm.provider "virtualbox" do |v|
    v.memory = 12248
    v.cpus = 4
  end

  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y puppet
    puppet module install puppetlabs-stdlib --version 5.2.0
  SHELL

  ## Puertos 
  config.vm.network :forwarded_port, guest: 3333, host: 3333, host_ip: "127.0.0.1" # OpenRefine

  config.vm.network :forwarded_port, guest: 8888, host: 8888, host_ip: "127.0.0.1" # Jupyter
  config.vm.network :forwarded_port, guest: 5000, host: 5000, host_ip: "127.0.0.1"

  ## TensorBoard
  config.vm.network :forwarded_port, guest: 8000, host: 8000, host_ip: "127.0.0.1"
  config.vm.network :forwarded_port, guest: 6006, host: 6006, host_ip: "127.0.0.1"

  ## Hadoop 2.8.5
  config.vm.network :forwarded_port, guest: 9000,   host: 9000,  host_ip: "127.0.0.1"  # dfs 
  config.vm.network :forwarded_port, guest: 50070,  host: 50070, host_ip: "127.0.0.1"  # Hadoop NameNode - http://127.0.0.1:50070/
  config.vm.network :forwarded_port, guest: 8088,   host: 8088,  host_ip: "127.0.0.1"  # Yarn ResourceManager - http://127.0.0.1:8088/
  config.vm.network :forwarded_port, guest: 8080,   host: 8080,  host_ip: "127.0.0.1"  # Zeppelin - http://127.0.0.1:8080/

  ## Spark UI
  config.vm.network :forwarded_port, guest: 8881,   host: 8881,  host_ip: "127.0.0.1"  # Spark - http://127.0.0.1:8881/
  config.vm.network :forwarded_port, guest: 8880,   host: 8880,  host_ip: "127.0.0.1"  # Spark - http://127.0.0.1:8880/
  config.vm.network :forwarded_port, guest: 4040,   host: 4040,  host_ip: "127.0.0.1"  # Spark - http://127.0.0.1:4040/
  config.vm.network :forwarded_port, guest: 4041,   host: 4041,  host_ip: "127.0.0.1"  # Spark - http://127.0.0.1:4041/

  ## Superset 
  config.vm.network :forwarded_port, guest: 3088,   host: 3088,  host_ip: "127.0.0.1"  # Supeset - http://127.0.0.1:3088/



  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = 'manifests'
    puppet.manifest_file = 'data-science.pp'
  end

  ##
  ##
  ## nodejs
  ##
  ##
  #config.vm.provision "puppet" do |puppet|
  #  puppet.manifests_path = 'manifests'
  #  puppet.manifest_file = 'nodejs.pp'
  #end

  ##
  ##
  ##  Jupyter
  ##
  ##
  #config.vm.provision "puppet" do |puppet|
  #  puppet.manifests_path = 'manifests'
  #  puppet.manifest_file = 'jupyter.pp'
  #end

  ##
  ##
  ##  Sphinx
  ##
  ##
  #config.vm.provision "puppet" do |puppet|
  #  puppet.manifests_path = 'manifests'
  #  puppet.manifest_file = 'sphinx.pp'
  #end

  
  

  ##
  ##
  ##  Python for Data Science
  ##
  ##
  #config.vm.provision "puppet" do |puppet|
  #  puppet.manifests_path = 'manifests'
  #  puppet.manifest_file = 'python-data-science.pp'
  #end

  


  ##
  ##
  ##  R & IRkernel
  ##
  ##
  #config.vm.provision "puppet" do |puppet|
  #  puppet.manifests_path = 'manifests'
  #  puppet.manifest_file = 'r-base.pp'
  #end

  ##
  ##
  ##  Bash kernel
  ##
  ##
  #config.vm.provision "puppet" do |puppet|
  #  puppet.manifests_path = 'manifests'
  #  puppet.manifest_file = 'bash.pp'
  #end

  ##
  ##
  ##  Jupyter Ruby kernel
  ##
  ##
  #config.vm.provision "puppet" do |puppet|
  #  puppet.manifests_path = 'manifests'
  #  puppet.manifest_file = 'iruby.pp'
  #end


  ##
  ##
  ## Julia Language
  ##
  ##
  #config.vm.provision "puppet" do |puppet|
  #  puppet.manifests_path = 'manifests'
  #  puppet.manifest_file = 'ijulia.pp'
  #end

  ##
  ##
  ##  MySQL
  ##
  ##
  #config.vm.provision "puppet" do |puppet|
  #  puppet.manifests_path = 'manifests'
  #  puppet.manifest_file = 'mysql.pp'
  #end

  ##
  ##
  ##  Machine Learning
  ##
  ##
  #config.vm.provision "puppet" do |puppet|
  #  puppet.manifests_path = 'manifests'
  #  puppet.manifest_file = 'machine-learning.pp'
  #end




  ##
  ##
  ##  TensorFlow en R
  ##
  ##
  #config.vm.provision "puppet" do |puppet|
  #  puppet.manifests_path = 'manifests'
  #  puppet.manifest_file = 'tensorflow-r.pp'
  #end

  ##
  ##
  ##  Hadoop
  ##
  ##  
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = 'manifests'
    puppet.manifest_file = 'hadoop-aws.pp'
  end


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


end
