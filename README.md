vim-conf
===

My Vim configuration.

Currently utilizes Vundle, a plugin manager for vim: https://github.com/gmarik/vundle

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

Additional information for OS X users
====

In case you're using OS X I recommend using MacVim: https://github.com/b4winckler/macvim. To get MacVim, you should use Brew http://mxcl.github.com/homebrew/, the missing package manager for OS X, which makes it trivial to install new software on your computer.

To install Brew run this one liner in your terminal: ```ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"```. After that you can download and compile MacVim like so: ```brew install macvim```.