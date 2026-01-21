# Instalação do OPEN5GS dentro do VirtualBox para simulação da RAM

A seguir está uma explicação clara e passo a passo de como instalar o OPEN5GS dentro do VirtualBox, usando uma máquina virtual Linux, para simulação de uma rede 5G (RAN/Core). O OPEN5GS é usado para simular o núcleo da rede 5G (5GC), enquanto a RAN normalmente é simulada com ferramentas como UERANSIM.

Ubuntu v 22.04.05

## Command

```bash
 vagrant up
 vagrant ssh core
 vagrant ssh ran
 vagrant reload --provision
 vagrant reload
 vagrant halt 
 vagrant reload
 vagrant destroy
```

## Instalação

### Geral
```bash
vagrant up
```

### Core

```bash
cd /vagrant/script/
./ohmyzsh.sh
sudo apt-get update && sudo apt-get upgrade -y
./open5gs.sh
```

### Ran

```bash
cd /vagrant/script/
./ohmyzsh.sh
sudo apt-get update && sudo apt-get upgrade -y

```



## WEBUI

Para acessar a webui, será necessario reconfigurar o arquivo index.js para aceitar qualquer ip de configuração. Nesse caso.

```bash
nano /usr/lib/node_modules/open5gs/server/index.js
```

Alterar a linha baixo para '0.0.0.0' conforme o exemplo.
```bash
server.listen(port,'0.0.0.0', err => {
```

E também deve possuir as linhas no vangrantfile, que já está pronto.

```bash
        config.vm.network "forwarded_port",
            guest: 9999,
            host: 9999,
            protocol: "tcp",
            auto_correct: true
```


## Erros 

### Erro noble_bartender

vagrant up
Bringing machine 'core' up with 'virtualbox' provider...
Bringing machine 'ran' up with 'virtualbox' provider...
==> core: Box 'noble_bartender' could not be found. Attempting to find and install...
    core: Box Provider: virtualbox
    core: Box Version: >= 0
==> core: Box file was not detected as metadata. Adding it directly...
==> core: Adding box 'noble_bartender' (v0) for provider: virtualbox (amd64)
    core: Downloading: noble_bartender
    core:
An error occurred while downloading the remote file. The error
message, if any, is reproduced below. Please fix this error and try
again.

Couldn't open file ##/noble_bartender

### Alterar a linha dentro do vagrantfile "noble_bartender"
```bash
config.vm.box = "ubuntu/jammy64"
```




### Erro disk

```bash
 vagrant up
Bringing machine 'core' up with 'virtualbox' provider...
Bringing machine 'ran' up with 'virtualbox' provider...
==> core: Box 'ubuntu/jammy64' could not be found. Attempting to find and install...
    core: Box Provider: virtualbox
    core: Box Version: >= 0
==> core: Loading metadata for box 'ubuntu/jammy64'
    core: URL: https://vagrantcloud.com/api/v2/vagrant/ubuntu/jammy64
==> core: Adding box 'ubuntu/jammy64' (v20241002.0.0) for provider: virtualbox
    core: Downloading: https://vagrantcloud.com/ubuntu/boxes/jammy64/versions/20241002.0.0/providers/virtualbox/unknown/vagrant.box
    core:
==> core: Successfully added box 'ubuntu/jammy64' (v20241002.0.0) for 'virtualbox'!
There are errors in the configuration of this machine. Please fix
the following errors and try again:

Vagrant:
* Unknown configuration section 'disksize'.
```

### Solução: 
```bash
vagrant plugin install vagrant-disksize
```


