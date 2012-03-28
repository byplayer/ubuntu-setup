sudo su root
aptitude install xubuntu-desktop zsh autotools-dev automake libtool \
  libevent-dev libncurses5-dev zlib1g-dev libbz2-dev libyaml-dev \
  libxml2-dev libxslt1-dev

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
