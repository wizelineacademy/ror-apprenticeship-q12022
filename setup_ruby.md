# Setup instructions

Please **read them carefully and execute all commands in the following order**. If you get stuck, don't hesitate to ask a mentors for help :raising_hand:

Let's start :rocket:

## VS Code

### Installation

Let's install some useful extensions to VS Code.

Copy-paste the following commands in your terminal:

```bash
code --install-extension ms-vscode.sublime-keybindings
code --install-extension emmanuelbeziat.vscode-great-icons
code --install-extension MS-vsliveshare.vsliveshare
code --install-extension rebornix.ruby
code --install-extension dbaeumer.vscode-eslint
code --install-extension Rubymaniac.vscode-paste-and-indent
```

Here is a list of the extensions you are installing:
- [Sublime Text Keymap and Settings Importer](https://marketplace.visualstudio.com/items?itemName=ms-vscode.sublime-keybindings)
- [VSCode Great Icons](https://marketplace.visualstudio.com/items?itemName=emmanuelbeziat.vscode-great-icons)
- [Live Share](https://marketplace.visualstudio.com/items?itemName=MS-vsliveshare.vsliveshare)
- [Ruby](https://marketplace.visualstudio.com/items?itemName=rebornix.Ruby)
- [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)
- [Paste and Indent](https://marketplace.visualstudio.com/items?itemName=Rubymaniac.vscode-paste-and-indent)


### Live Share configuration

[Visual Studio Live Share](https://visualstudio.microsoft.com/services/live-share/) is a VS Code extension which allows you to share the code in your text editor for debugging and pair-programming: let's set it up!

Launch VS Code from your terminal by typing `code` and pressing `ENTER`.

Click on the little arrow at the bottom of the left bar :point_down

- Click on the "Share" button, then on "GitHub (Sign in using GitHub account)".
- A popup appears asking you to sign in with GitHub: click on "Allow".
- You are redirected to a GitHub page in you browser asking you to authorize Visual Studio Code: click on "Continue" then "Authorize github".
- VS Code may display additional pop-ups: close them by clicking "OK".

That's it, you're good to go!



## zsh

**MacOS skip this section!**

Instead of using the default `bash` [shell](https://en.wikipedia.org/wiki/Shell_(computing)), we will use `zsh`.

In a terminal execute the following command and type in your password if asked:

```bash
sudo apt install -y zsh curl vim imagemagick jq unzip
```


## Oh-my-zsh

Let's install the `zsh` plugin [Oh My Zsh](https://ohmyz.sh/).

In a terminal execute the following command:

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

If asked "Do you want to change your default shell to zsh?", press `Y`

At the end your terminal should look like this:

![Ubuntu terminal with OhMyZsh](https://www.linuxhowto.net/wp-content/uploads/2020/10/Installation-of-Oh-My-Zsh-in-Ubuntu.png)

:heavy_check_mark: If it does, you can continue.


## Disable SSH passphrase prompt

You don't want to be asked for your passphrase every time you communicate with a distant repository. So, you need to add the plugin `ssh-agent` to `oh my zsh`:

First, open the `.zshrc` file:

```bash
code ~/.zshrc
```

Then:
- Spot the line starting with `plugins=`
- Add `ssh-agent` at the end of the plugins list

The list should look like:

```bash
plugins=(gitfast last-working-dir common-aliases zsh-syntax-highlighting history-substring-search pyenv ssh-agent)
```

:heavy_check_mark: Save the `.zshrc` file with `Ctrl` + `S` and close your text editor.


## rbenv

Let's install [`rbenv`](https://github.com/sstephenson/rbenv), a software to install and manage `ruby` environments.

First, we need to clean up any previous Ruby installation you might have:

```bash
rvm implode && sudo rm -rf ~/.rvm
# If you got "zsh: command not found: rvm", carry on.
# It means `rvm` is not on your computer, that's what we want!
rm -rf ~/.rbenv
```

Then in the terminal, run:

```bash
sudo apt install -y build-essential tklib zlib1g-dev libssl-dev libffi-dev libxml2 libxml2-dev libxslt1-dev libreadline-dev
```

```bash
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
```

```bash
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
exec zsh
```


## Ruby

### Installation

Now, you are ready to install the latest [ruby](https://www.ruby-lang.org/en/) version and set it as the default version.

Run this command, it will **take a while (5-10 minutes)**

```bash
rbenv install 3.0.3
```

Once the ruby installation is done, run this command to tell the system
to use the 3.0.3 version by default.

```bash
rbenv global 3.0.3
```

**Reset** your terminal and check your Ruby version:

```bash
exec zsh
```

Then run:

```bash
ruby -v
```

:heavy_check_mark: If you see something starting with `ruby 3.0.3p` then you can proceed to next.


### Installing some gems

In the ruby world, we call external libraries `gems`: they are pieces of ruby code that you can download and execute on your computer. Let's install some!

In your terminal, copy-paste the following command:

```bash
gem install rake bundler rspec rubocop rubocop-performance pry pry-byebug colored http 'rails:~>7.0'
```

:heavy_check_mark: If you get `xx gems installed`, then all good.

:x: If you encounter the following error:

```bash
ERROR: While executing gem ... (TypeError)
incompatible marshal file format (can't be read)
format version 4.8 required; 60.33 given
```

Run the following command:
```bash
rm -rf ~/.gemrc
```

Rerun the command to install the gems.

:warning: **NEVER** install a gem with `sudo gem install`! Even if you stumble upon a Stackoverflow answer (or the terminal) telling you to do so.


## Node.js

[Node.js](https://nodejs.org/en/) is a JavaScript runtime to execute JavaScript code in the terminal. Let's install it with [nvm](https://github.com/nvm-sh/nvm), a version manager for Node.js.

In a terminal, execute the following commands:

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | zsh
exec zsh
```

Then run the following command:

```bash
nvm -v
```

You should see a version.

Now let's install node:

```bash
nvm install 17.3.1
```

When the installation is finished, run:

```bash
node -v
```

If you see `v17.3.1`, the installation succeeded :heavy_check_mark: You can then run:

```bash
nvm cache clear
```


## yarn

[`yarn`](https://yarnpkg.com/) is a package manager to install JavaScript libraries. Let's install it:

In a terminal, run the following commands:

```bash
npm install --global yarn
exec zsh
```

Then run the following command:

```bash
yarn -v
```

:heavy_check_mark: If you see a version, you're good.


