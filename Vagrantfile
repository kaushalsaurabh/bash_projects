
Vagrant.configure("2") do |config|

 # config.vm.box = "hashicorp/bionic64"

  config.vm.provider "docker" do |docker, override|
    # docker doesnt use boxes
    override.vm.box = nil

    # this is where your Dockerfile lives
    docker.build_dir = "."

    # Make sure it sets up ssh with the Dockerfile
    # Vagrant is pretty dependent on ssh
    override.ssh.insert_key = true
#    override.nfs.functional = false
    docker.has_ssh = true

    # Configure Docker to allow access to more resources
    docker.privileged = true

    #Configure memory and CPU
    docker.create_args = ['--cpus="2"']
    docker.create_args = ['--memory=4g']
    docker.name = 'ubuntu-dev'

  end

  config.vm.hostname = "ubuntu-dev"
  config.vm.synced_folder "../", "/vagrant", docker_consistency: "cached"

  config.vm.network :forwarded_port, guest: 3000, host: 3000, auto_correct: true # Server port for any servers to be started


  config.vm.provision :shell, path: './startup/bootstrap.sh', keep_color: true


end
