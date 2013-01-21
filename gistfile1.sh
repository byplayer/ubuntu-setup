# for ubuntu 11.10

sudo su root
apt-get install aptitude

aptitude install xubuntu-desktop zsh autotools-dev automake libtool \
  libevent-dev libncurses5-dev zlib1g-dev libbz2-dev libyaml-dev \
  libxml2-dev libxslt1-dev libreadline-dev xsel patch \
  chromium-browser \
  ibus-mozc mozc-server mozc-utils-gui \
  exuberant-ctags \
  emacs emacsen-common xfonts-shinonome python-xlib \
  libterm-readkey-perl \
  mlocate ssh \
  libsqlite3-dev sqlite3 \
  expect dkms

cd /usr/local/src
wget https://raw.github.com/byplayer/docs/master/git/git-install.sh
chmod a+x git-install.sh
./git-install.sh

# exit root
exit

# config git
# https://github.com/byplayer/docs/blob/master/git/git_config.txt

# relogin xubuntu-session


# change shell to zsh
chsh -s /usr/bin/zsh

export PATH=/usr/local/git/bin:$PATH
cd ~/
git clone https://byplayer@github.com/byplayer/dot.zsh.d.git .zsh.d
cp .zsh.d/example.zshrc .zshrc

mkdir ~/projects/
cd ~/projects/
git clone https://byplayer@github.com/byplayer/dotfiles.git

cp dotfiles/ubuntu/.dir_colors ~/
cp dotfiles/ubuntu/.globalrc ~/
cp dotfiles/ubuntu/.ctags ~/
cp dotfiles/ubuntu/.tmux.conf ~/
mkdir -p ~/.config/Terminal
cp dotfiles/ubuntu/.config/Terminal/terminalrc ~/.config/Terminal/

# reopen terminal
cd ~/projects/
g clone https://byplayer@github.com/byplayer/tmux.git

cd tmux/tags/TMUX_1_6
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
bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)

# restart shell
unset GREP_OPTIONS
rvm install ruby 1.9.3
rvm install ruby 1.9.2
rvm install ruby 1.8.7

# ssh key
ssh-keygen -t rsa -C ${USER}@`hostname`


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

# for typo
sudo aptitude install python-feedvalidator

# sublimetext
sudo su root
cd /usr/local/src
wget wget http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.1%20x64.tar.bz2
tar xjf Sublime\ Text\ 2.0.1\ x64.tar.bz2
mv Sublime\ Text\ 2 /usr/local/SublimeText