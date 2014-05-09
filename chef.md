install
====

    TARGET_RUBY=ruby-2.1.1
    rvm use ${TARGET_RUBY}
    rvm gemset create chef
    rvm use ${TARGET_RUBY}@chef

    rvm-prompt
    gem install chef
    gem install knife-solo

