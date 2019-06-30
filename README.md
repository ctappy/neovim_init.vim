Neovim setup
=========
#### Install Neovim

##### TS
```
npm -g install typescript
npm install -g neovim
```
May need to install the npm packages for rplugin see
`https://github.com/mhartington/nvim-typescript/issues/197#issuecomment-469134118`

##### Create GOPATH and add to PATH, add to .bashrc .zshrc to become permanent

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

###### install gocode
go get -u github.com/nsf/gocode

###### install go please
go get -u golang.org/x/tools/cmd/gopls

##### Arch
the latest neovim may have issue with some of these plugs, tested up to 0.2.0
```
sudo pacman -S python2-neovim python-neovim

# Depending on your package manager for the AUR
yaourt -S ruby-neovim tidy-html5 xclip go
pip install pylint

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

confirm "Install pylint, python syntax checker?" && pip install pylint

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
git clone https://github.com/ctaperts/neovim_init.vim.git ~/.config/nvim
```

#### Then install Plugs, type :q(return) twice to exit
nvim -c PlugInstall

Options
------
* ctrl-e - open netrw
* ctrl-s - open startify
* ctrl-u - write to file
* ctrl-q - exit vim
* ctrl-l - run FZF search
* ctrl-c - copy current word under cursor to memory buffer
* ctrl-f - setup find and replace :s%///g
* ctrl-g - setup find and replace with current word under text
* ctrl-m - run code (Make is setup for python)
* enter  - run code (Make is setup for python or golang)
* ctrl-a - git commit -am ''
* ctrl-p - git push
* F6     - build go
* F7     - test go
* F8     - run go

Info
-----
Includes:
* [fzf](https://github.com/junegunn/fzf.vim)
* [vim-startify](https://github.com/mhinz/vim-startify)
* [lightline.vim](https://github.com/itchyny/lightline.vim)
* [vim-github-dashboard](https://github.com/junegunn/vim-github-dashboard)
* [syntastic](https://github.com/scrooloose/syntastic)
* [vim-colorschemes](https://github.com/flazz/vim-colorschemes)
* [vim-lastplace](https://github.com/dietsche/vim-lastplace)
