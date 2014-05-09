# install

    TARGET_RUBY=ruby-2.1.1
    rvm use ${TARGET_RUBY}
    rvm gemset create chef
    rvm use ${TARGET_RUBY}@chef

    rvm-prompt

    gem install chef
    gem install knife-solo



# misc

https://github.com/muratayusuke/chef-global
こんな感じでリポジトリ作って、

http://community.opscode.com/cookbooks/global
こんな感じでopscodeに上げとけば、どっからでもBerkshelfでもってこれます

https://github.com/muratayusuke/chef-devenv
