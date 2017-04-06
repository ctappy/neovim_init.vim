Neovim setup
=========
#### Install Neovim
##### Arch
```
sudo pacman -S python2-neovim python-neovim

# Depending on your package manager for the AUR
yaourt -S ruby-neovim tidy-html5 xclip go flake8

# Create GOPATH and add to PATH, add to .bashrc .zshrc to become permanent

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# install gocode golint
go get -u github.com/nsf/gocode && go get -u github.com/golang/lint/golint
go get -u -ldflags -H=windowsgui github.com/nsf/gocode

```
##### Ubuntu

```
#!/bin/bash

# Check if user is root
if [ $(id -u) != "0" ]; then
    echo "Error: You must be root to run this script, please use root to install the software."
    exit 1
fi

confirm() {
    # call with a prompt string or use a default
    read -r -p "${1:-Are you sure? [y/N]} " response
    case "$response" in
        [yY][eE][sS]|[yY])
            true
            ;;
        *)
            false
            ;;
    esac
}

# install go ppa

confirm "install go ppa?" && add-apt-repository ppa:longsleep/golang-backports && apt-get update && apt-get install golang-go

confirm "Install tidy-html5 syntax checker?" && mkdir /tmp/htmltidy && cd /tmp/htmltidy && git clone https://github.com/w3c/tidy-html5 && cd tidy-html5/build/cmake && cmake ../.. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr && make && make install && rm /tmp/htmltidy -rf

confirm "Install flake8, python syntax checker?" && apt install flake8

apt-get install software-properties-common
apt-get install python-dev python-pip python3-dev python3-pip xclip git-core automake libtool cmake python-dev python-pip python3-dev gocode golint
apt-get install python3-setuptools
add-apt-repository ppa:neovim-ppa/stable
apt-get update
apt-get install neovim
easy_install3 pip
pip2 install --upgrade neovim

```

##### Everything else

https://github.com/neovim/neovim/wiki/Installing-Neovim

### Install neovim setup

#### Requirements

* Your Vim must have Ruby support enabled. Check if :echo has('ruby') prints 1.
* If you see LoadError on :ruby require 'json/pure', you need to install json_pure gem.

#### Copy and paste this into terminal
```
cd ~/.config/ && git clone https://github.com/ctaperts/neovim_init.vim.git nvim && cd nvim/bundle/ && git clone https://github.com/Valloric/YouCompleteMe.git && cd YouCompleteMe/ && git submodule update --init --recursive && ./install.py
```

#### Then install Plugs, type :q(return) twice to exit
nvim -c PlugInstall

#### Setup Github Dashboard
[Instruction to setup github token](https://help.github.com/articles/creating-an-access-token-for-command-line-use/)

add to bashrc 

```
export GITHUB_USERNAME="<username>"
export GITHUB_TOKEN="<github token>"
```

Options
------
* ctrl-e - open netrw
* ctrl-s - open startify
* ctrl-w - write to file
* ctrl-q - exit vim
* ctrl-l - run FZF search
* ctrl-c - setup find and replace :s%/from/to/g
* ctrl-v - Github activity
* ctrl-m - run code (Make is setup for python)
* enter  - run code (Make is setup for python)
* ctrl-a - git add .
* ctrl-g - git commit -m ''
* ctrl-p - git push
* F5     - run go
* F6     - build go
* F7     - test go

Info
-----
Includes:
* [fzf](https://github.com/junegunn/fzf.vim)
* [vim-rake](https://github.com/tpope/vim-rake)
* [vim-startify](https://github.com/mhinz/vim-startify)
* [lightline.vim](https://github.com/itchyny/lightline.vim)
* [vim-github-dashboard](https://github.com/junegunn/vim-github-dashboard)
* [YouCompleteMe](https://valloric.github.io/YouCompleteMe/)
* [syntastic](https://github.com/scrooloose/syntastic)
* [vim-colorschemes](https://github.com/flazz/vim-colorschemes)
* [vim-lastplace](https://github.com/dietsche/vim-lastplace)
* [vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides) (only works in gvim)
* [vim-rails](https://github.com/tpope/vim-rails)
