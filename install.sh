# Symlink.sh

dotfiles_dir=~/dotfiles

cat packages.txt | xargs sudo apt install -y
pip3 install -r pip-packages.txt

while true; do
    read -p "Do you want to install oh-my-zsh y/n " yn
    case $yn in
        [Yy]* ) sh -c "$(rm -rf ~/.oh-my-zsh && wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"         break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

rm -rf ~/.zshrc
cp $dotfiles_dir/.zshrc ~

echo "Install finished"
exit 0
