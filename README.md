# Kyle Wiest's Dotfiles

These are my personal dotfiles, customized slightly but mostly stolen from people smarter than I. Currently, I'm using [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) as a framework to build on.

For editing, I use VIM with the following plugins:

* Command-T: Fast file navigation
* Coffeescript: Syntax for Coffee-Script
* Endwise: Automatically (and smartly) and "end"
* Haml: Syntax for Haml
* Mustache.Vim: Syntax for Mustache.
* NERDCommenter: Easy comment manipulation.
* Rag Tag: Tim Pope's mappings for (X)HTML manipulation
* Rails: Self explanatory
* Supertab: Tab completion for current context
* Surround: Mappings to surround text in quotes, tags, etc.
* Tabular: Helps with auto-formatting tabs around characters
* Vim-Colors-Solarized: Solarized themes for gvim

## Installation

### Step 1 - Backup all of your files

### Step 2 - Clone dotfiles
* `git clone https://github.com/kwiest/dotfiles.git ~/.dotfiles`
* `cd .dotfiles`

### Step 3 - Run rake install to create sym links
* `rake install`


Original Oh-My-Zsh README
-------------------------

A handful of functions, auto-complete helpers, and stuff that makes you
shout…

> “OH MY ZSHELL!”

Setup
-----

`oh-my-zsh` should work with any recent release of
[zsh](http://www.zsh.org/), the minimum recommended version is 4.3.9.

### The automatic installer… (do you trust me?)

You can install this via the command line with either \`curl\` or
\`wget\`.

#### via \`curl\`

`curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh`

#### via \`wget\`

`wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh`

### The manual way

​1. Clone the repository

`git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh`

​2. Create a new zsh config by copying the zsh template we’ve provided.

**NOTE**: If you already have a
~/.zshrc\\ file,\\ you\\ should\\ back\\ it\\ up.\\ `cp ~/.zshrc ~/.zshrc.orig`\\ in\\ case\\ you\\ want\\ to\\ go\\ back\\ to\\ your\\ original\\ settings.
\
\\ `cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc`
\
3.\\ Set\\ zsh\\ as\\ your\\ default\\ shell:
\
\\ `chsh -s /bin/zsh`
\
4.\\ Start\\ /\\ restart\\ zsh\\ 
\
h3.\\ Problems?
\
You\\ *might*\\ need\\ to\\ modify\\ your\\ PATH\\ in~/.zshrc if you’re
not able to find some commands after switching to *Oh My Zsh*.

Usage
-----

-   enable the plugins you want in your `~/.zshrc` (take a look at
    `plugins/` to see what’s possible)
    -   example: `plugins=(git osx ruby)`

-   Theme support: Change the `ZSH_THEME` environment variable in
    `~/.zshrc`.
    -   Take a look at the [current
        themes](https://wiki.github.com/robbyrussell/oh-my-zsh/themes)
        that come bundled with *Oh My Zsh*.

-   much much more… take a look at `lib/` what *Oh My Zsh* offers…

Useful
------

the [refcard](http://www.bash2zsh.com/zsh_refcard/refcard.pdf) is pretty
tasty for tips.

### Customization

If you want to override any of the default behavior, just add a new file
(ending in `.zsh`) into the `custom/` directory.\
If you have many functions which go well together you can put them as a
**.plugin.zsh file in the `custom/plugins/` directory and then enable
this plugin.\
If you would like to override the functionality of a plugin distributed
with oh-my-zsh, create a plugin of the same name in the
`custom/plugins/` directory and it will be loaded instead of the one in
`plugins/`.

\
h3. Uninstalling
\
If you want to uninstall it, just run `uninstall_oh_my_zsh` from the
command line and it’ll remove itself and revert you to bash .
\
h2. Help out!
\
I’m far from being a zsh-expert and suspect there are many ways to
improve. If you have ideas on how to make the configuration easier to
maintain , don’t hesitate to fork and send pull requests!
\
h3. Send us your theme!
\
~~I’m hoping to collect a bunch of themes for our command prompts. You
can see existing ones in the `themes/` directory.~~
\
We have enough themes for the time being. Please fork the project and
add on in there, you can let people know how to grab it from there.


\
h2. Contributors
\
This project wouldn’t exist without all of our awesome users and
contributors.
\
** [View our growing list of
contributors](https://github.com/robbyrussell/oh-my-zsh/contributors)

Thank you so much!
