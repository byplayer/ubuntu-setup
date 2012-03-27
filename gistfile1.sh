sudo su root
aptitude intall xubuntu-desktop zsh

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