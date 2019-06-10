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

  ##
  ## 
  ## Ciencia de los Datos y Analítica Predictiva
  ##
  ##
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = 'manifests'
    puppet.manifest_file = 'data-science.pp'
  end

  ##
  ##
  ##  Hadoop
  ##
  ##  
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = 'manifests'
    puppet.manifest_file = 'hadoop-aws.pp'
  end

end
