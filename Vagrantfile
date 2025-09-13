Vagrant.configure("2") do |config|
  # Use a Ubuntu 22.04 image
  config.vm.box = "ubuntu/jammy64"

  # Create a virtual machine and name it 'web-server'
  config.vm.define "web-server" do |web|
    # Set a fixed private IP address (like an Elastic IP).
    # This is the IP we will use to access the website.
    web.vm.network "private_network", ip: "192.168.56.10"

    # Configure VM resources (optional)
    web.vm.provider "virtualbox" do |vb|
      vb.memory = "1024" # 1GB RAM
      vb.cpus = 1        # 1 CPU core
      vb.name = "web-server-vm"
    end

    # Provision the VM with Ansible (Optional: we'll use GitHub Actions later)
    # web.vm.provision "ansible" do |ansible|
    #   ansible.playbook = "ansible/playbook.yml"
    # end
  end
end
