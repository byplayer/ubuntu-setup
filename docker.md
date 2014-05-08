target
====
ubuntu 13.04

basic setup
====

    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get install ssh build-essential libssl-dev


install ruby
====

    curl -sSL https://get.rvm.io | bash -s stable
    rvm install ruby-2.1.1


install lxc and Docker
====

    sudo apt-get install linux-image-extra-`uname -r`

    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9

    sudo sh -c "echo deb http://get.docker.io/ubuntu docker main\
      > /etc/apt/sources.list.d/docker.list"

    sudo apt-get update
    sudo apt-get install lxc-docker

If you want to run not using sudo

    sudo usermod -G docker $USER

