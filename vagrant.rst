install plugin
====
    vagrant plugin install vagrant-vbox-snapshot
    vagrant plugin install vagrant-vbguest
    vagrant plugin install vagrant-omnibus

If you receive nokogiri error, please try following option.

     NOKOGIRI_USE_SYSTEM_LIBRARIES=1 vagrant plugin install vagrant-digitalocean

init
====

    vagrant init ${box_name}


start
====

    vagrant up
