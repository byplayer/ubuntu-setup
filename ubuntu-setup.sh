# for ubuntu 13.10

sudo su root

apt-get update
apt-get upgrade

# restart

sudo su root
apt-get install aptitude

# for 13.04
# sudo add-apt-repository ppa:cassou/emacs
# sudo apt-get update
# sudo apt-get install emacs24
#
# sudo apt-add-repository ppa:mizuno-as/silversearcher-ag

aptitude install lubuntu-desktop zsh autotools-dev automake libtool \
  libevent-dev libncurses5-dev zlib1g-dev libbz2-dev libyaml-dev \
  libxml2-dev libxslt1-dev libreadline-dev xclip patch \
  chromium-browser \
  ibus-mozc mozc-server mozc-utils-gui \
  exuberant-ctags \
  emacs24 emacsen-common ibus-el xfonts-shinonome python-xlib \
  libterm-readkey-perl \
  mlocate ssh \
  libsqlite3-dev sqlite3 \
  expect dkms \
  ia32-libs \
  silversearcher-ag

# restart

sudo su root
cd /usr/local/src
wget https://raw.github.com/byplayer/docs/master/git/git-install.sh
chmod a+x git-install.sh
./git-install.sh

# exit root
exit

# relogin xubuntu-session


# change shell to zsh
chsh -s /usr/bin/zsh

export PATH=/usr/local/git/bin:$PATH

# config git
# https://github.com/byplayer/docs/blob/master/git/git_config.txt

cd ~/
git clone https://byplayer@github.com/byplayer/dot.zsh.d.git .zsh.d
cd ~/.zsh.d
git sm update --init --recursive

cp .zsh.d/example.zshrc .zshrc

mkdir -p ~/projects/
cd ~/projects/
git clone https://byplayer@github.com/byplayer/dotfiles.git

cp dotfiles/ubuntu/.dir_colors ~/
cp dotfiles/ubuntu/.globalrc ~/
cp dotfiles/ubuntu/.ctags ~/
cp dotfiles/ubuntu/.tmux.conf ~/
cp dotfiles/ubuntu/.Xresources ~/

# TODO
mkdir -p ~/.gconf/apps
cp -r dotfiles/ubuntu/.gconf/apps/gnome-terminal ~/.gconf/apps/

cp dotfiles/ubuntu/.xprofile ~/

# mkdir -p ~/.config/Terminal
# cp dotfiles/ubuntu/.config/Terminal/terminalrc ~/.config/Terminal/

# reopen terminal
cd ~/projects/
g clone https://byplayer@github.com/byplayer/tmux.git

cd tmux
sh ./autogen.sh
./configure --prefix=/usr/local/tmux
make
sudo make install

# -----------------------------
# global
sudo su root
cd /usr/local/src
wget https://raw.github.com/byplayer/docs/master/linux/install/install_global.sh
sh ./install_global.sh

# -----------------------------
# ruby
curl -sSL https://get.rvm.io | bash -s stable
rvm install ruby-2.1.0

# ssh key
ssh-keygen -t rsa -C ${USER}@`hostname`
ssh-add

# use mozc via i-bus
# change Input Method Switcher in Setting
# start Keyboard Input Method in Setting menu

# emacs
cd ~/
git clone https://byplayer@github.com/byplayer/dot.emacs.d.git .emacs.d

cd .emacs.d
g sm update --init --recursive

cd ~/.emacs.d
g co -b local

pushd elisp/js2-mode
emacs --batch -f batch-byte-compile js2-mode.el
popd

# mlocate
sudo su root
cd /etc
mv updatedb.conf updatedb.conf.`date '+%Y%m%d%H%M%S'`
wget https://raw.github.com/byplayer/dotfiles/master/ubuntu/updatedb.conf

# run updatedb hourly
cd /usr/local/src
wget https://raw.github.com/byplayer/dotfiles/master/ubuntu/crontab.root
crontab -l > crontab.root.old
crontab crontab.root
crontab -l > crontab.root.new
diff crontab.root.old crontab.root.new

# sublimetext
sudo su root
add-apt-repository ppa:webupd8team/sublime-text-2
aptitude update
aptitude install sublime-text

# open sublime text is following command
# subl

# node
sudo apt-get install python-software-properties
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-key adv --recv-key --keyserver keyserver.ubuntu.com B9316A7BC7917B12

sudo apt-get update
sudo apt-get install nodejs

# stop blanking
# xset -dpms s off s noblank s 0 0 s noexpose
