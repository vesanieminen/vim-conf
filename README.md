vim-conf
===

My Vim configuration.

Currently utilizes Vundle package manager: https://github.com/gmarik/vundle

Installation
====

 * Back up your current vim configuration files (.vimrc and .gvimrc) and your ~/.vim directory so you don't lose anything important.
 * Remove current vim setup totally:

```
rm -rf ~/.vim
rm ~/.vimrc
rm ~/.gvimrc
```

 * Clone vundle under the .vim directory:

```
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```

 * Clone my vim-conf repo under some directory (eg. ~/.vim/vim-conf) and create symbolic links to your home directory root:

```
git clone git://github.com/vesanieminen/vim-conf.git ~/.vim/vim-conf
ln -s ~/.vim/vim-conf/.vimrc ~/.vimrc
ln -s ~/.vim/vim-conf/.gvimrc ~/.gvimrc
```

 * Now you're ready to start proper vimming :)