Neovim config folder install
=========
```
cd ~/.config/
git clone git@github.com:ctaperts/neovim_init.vim.git nvim
nvim -c PlugInstall
cd nvim/bundle/
git clone https://github.com/Valloric/YouCompleteMe.git
cd YouCompleteMe/
git submodule update --init --recursive
./install.py
```
