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


misc
=====
https://github.com/muratayusuke/chef-global
こんな感じでリポジトリ作って、

http://community.opscode.com/cookbooks/global
こんな感じでopscodeに上げとけば、どっからでもBerkshelfでもってこれます
=======
docker command
====

pull image with tag
----

    docker pull ubuntu:13.10
    docker pull ubuntu:14.04


run with tag
----

    docker run ubuntu:13.10 /bin/echo hello world


start container and attach
----

    docker start -a <CONTAINER-ID>


attach
----

    docker attach {{ CONTAINER-ID }}


detouch
----

input following command in docker shell
Ctrl + p Ctrl + q


remove all images
----

    docker rm $(docker ps -a -q)


remove image
----

    docker rmi {{ IMAGE-ID }}


run background
----

    docker run -i -t -d base /bin/bash


ホストのディレクトリをマウントしてコンテナを起動
----
docker run -v /hos_tdir:/opt/cnt_dir -i -t  centos /bin/bash


detouch container
----
ctrl-p ctrl-q


コンテナをコミット
----

    docker run -i -t -d --name cent01 centos /bin/bash
    docker commit cent01 test1/centos


コミットしたコンテナで別のコンテナを起動
----

    docker run -i -t -d --name cent02 test1/centos /bin/bash


コンテナをエクスポート
----

名前orIDを指定

    docker export cent01 > cent01.tar


URLを指定してインポート(imageに登録される)
----

    docker import http://hoge.com/cent01.tar cent01


ローカルファイルを指定してインポート(imageに登録される)
----

    cat cent01.tar | docker import - cent01
