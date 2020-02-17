Vagrant.configure("2") do |config|
  
  config.vm.box = "jdvelasq/aws:20200215.0.0"

  #
  # se debe ejecutar en el prompt
  #
  #    vagrant plugin install vagrant-disksize
  #
  config.disksize.size = '10GB'

  config.vm.provider "virtualbox" do |v|
    v.memory = 8064
    v.cpus = 4
  end
  
  #
  # Puertos 
  #

  # Jupyter
  config.vm.network :forwarded_port, guest: 8888, host: 8888, host_ip: "127.0.0.1" 
  config.vm.network :forwarded_port, guest: 5000, host: 5000, host_ip: "127.0.0.1"

  # TensorBoard
  config.vm.network :forwarded_port, guest: 8000, host: 8000, host_ip: "127.0.0.1"
  config.vm.network :forwarded_port, guest: 6006, host: 6006, host_ip: "127.0.0.1"

  # Hadoop 2.8.5 - dfs 
  config.vm.network :forwarded_port, guest: 9000,   host: 9000,  host_ip: "127.0.0.1"  # dfs 

  # Hadoop NameNode - http://127.0.0.1:50070/
  config.vm.network :forwarded_port, guest: 50070,  host: 50070, host_ip: "127.0.0.1"  

  # Yarn ResourceManager - http://127.0.0.1:8088/
  config.vm.network :forwarded_port, guest: 8088,   host: 8088,  host_ip: "127.0.0.1"  


  # Spark UI
  config.vm.network :forwarded_port, guest: 8881,   host: 8881,  host_ip: "127.0.0.1"  # Spark - http://127.0.0.1:8881/
  config.vm.network :forwarded_port, guest: 8880,   host: 8880,  host_ip: "127.0.0.1"  # Spark - http://127.0.0.1:8880/
  config.vm.network :forwarded_port, guest: 4040,   host: 4040,  host_ip: "127.0.0.1"  # Spark - http://127.0.0.1:4040/
  config.vm.network :forwarded_port, guest: 4041,   host: 4041,  host_ip: "127.0.0.1"  # Spark - http://127.0.0.1:4041/

end
