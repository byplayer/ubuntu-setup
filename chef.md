# install

    TARGET_RUBY=ruby-2.1.1
    rvm use ${TARGET_RUBY}
    rvm gemset create chef
    rvm use ${TARGET_RUBY}@chef

    rvm-prompt

    gem install chef
    gem install knife-solo
    gem install berkshelf


# init knife

    knife configure


# make chef repo

    knife solo init chef-repo
    cd chef-repo

TODO: check to need to run following command
    berks init


# make cook book

    cd chef-repo
    knife cookbook create [cookbook-name] -o site-cookbooks


# berkshelf

make following file Berksfile


    source "https://api.berkshelf.com"

    cookbook 'tmux'

install cookbooks

    berks install

# prepare
    knife solo prepare ${host}

# run knife

    knife solo cook ${host} nodes/devenv.json

jsonファイルを指定しない場合は、nodes/${host}.json
が使われる

# reference

https://github.com/muratayusuke/chef-global
こんな感じでリポジトリ作って、

http://community.opscode.com/cookbooks/global
こんな感じでopscodeに上げとけば、どっからでもBerkshelfでもってこれます

https://github.com/muratayusuke/chef-devenv

how to run shef
http://hivecolor.com/id/126
