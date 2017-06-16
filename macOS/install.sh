#!/usr/bin/env bash
# this is the install script for much dotfiles

echo Starting Dotfiles

# Update App Store apps
sudo softwareupdate -i -a

# Update Ruby & gems
sudo gem update —system
sudo gem update


# xcode utils
echo Pls install xcode tools
xcode-select --install


##########################
# Time to install utilities!
##########################
echo Installing some utils
# Update Homebrew (Cask) & packages
brew update
brew upgrade
brew doctor

##########################
# brew
##########################
echo Installing Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo Installing Homebrew Cask
brew tap caskroom/cask
echo Installing Cask Versions
brew install brew-cask
brew tap caskroom/versions
brew install zsh
brew cask install iterm2

# oh my zsh
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"




