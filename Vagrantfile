# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    config.vm.box = "ubuntu/jammy64"
    config.vm.boot_timeout = 600
    config.disksize.size = "100GB"


    config.vm.define "core" do |core|
        core.vm.hostname = "core"
        core.vm.network "private_network", ip: "192.168.56.10"
        config.vm.network "forwarded_port",
            guest: 9999,
            host: 9999,
            protocol: "tcp",
            auto_correct: true
    end

    config.vm.define "ran" do |ran|
        ran.vm.hostname = "ran"
        ran.vm.network "private_network", ip: "192.168.56.11"
    end

    config.vm.provider "virtualbox" do |vb|
        vb.memory = "4096"
        vb.cpus = "4"
    end

    config.vm.provision "shell", inline: <<-SHELL
        echo "192.168.56.10 coreip coreip" >> /etc/hosts
        echo "192.168.56.11 ranip ranip" >> /etc/hosts
        echo "set number" > /home/vagrant/.vimrc
        chown vagrant:vagrant /home/vagrant/.vimrc
        apt-get update
        apt-get upgrade -y
        apt-get install -y curl wget git zsh htop vim nano nmap whois 
    SHELL

end