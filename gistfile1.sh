sudo su root
aptitude install xubuntu-desktop zsh autotools-dev automake libtool \
  libevent-dev libncurses5-dev zlib1g-dev libbz2-dev libyaml-dev \
  libxml2-dev libxslt1-dev libreadline-dev xsel patch \
  chromium-browser \
  ibus-mozc mozc-server mozc-utils-gui \
  exuberant-ctags \
  emacs23-common emacsen-common

wget https://raw.github.com/byplayer/docs/master/git/git-install.sh
chmod a+x git-install.sh
./git-install.sh

# exit root
exit

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
cp dotfiles/ubuntu/.tmux.conf ~/
mkdir -p ~/.config/Terminal
cp dotfiles/ubuntu/.config/Terminal/terminalrc ~/.config/Terminal/

# reopen terminal
cd ~/projects/
g clone https://byplayer@github.com/byplayer/tmux.git

cd tmux/trunk
./autogen.sh 
./configure --prefix=/usr/local/tmux 
make
sudo make install

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
g sm init

g co -b local
