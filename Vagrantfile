Vagrant.configure("2") do |config|
  
  ##
  ##
  ## Configuración mínima de la VM 
  ##
  ##
  config.vm.box = "ubuntu/bionic64"
  ##   Puppet
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y puppet
    puppet module install puppetlabs-stdlib --version 5.2.0
  SHELL

  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = 'manifests'
    puppet.manifest_file = 'jupyter-min.pp'
  end

  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = 'manifests'
    puppet.manifest_file = 'sphinx.pp'
  end

  ## Puertos para correr Juyter desde la VM
  config.vm.network :forwarded_port, guest: 8888, host: 8888, host_ip: "127.0.0.1"

  ##
  ##
  ##  Python for Data Science
  ##
  ##
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = 'manifests'
    puppet.manifest_file = 'python-data-science.pp'
  end

  ##
  ##
  ##  R & IRkernel
  ##
  ##
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = 'manifests'
    puppet.manifest_file = 'r-base.pp'
  end

  ##
  ##
  ##  Bash
  ##
  ##
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = 'manifests'
    puppet.manifest_file = 'bash.pp'
  end

  ##
  ##
  ##  MySQL
  ##
  ##
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = 'manifests'
    puppet.manifest_file = 'mysql.pp'
  end

end
