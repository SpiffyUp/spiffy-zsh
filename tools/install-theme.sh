bash
#!/bin/sh

# Download and install the spiffy-zsh theme
echo "Installing spiffy-zsh theme..."
curl -fsSL https://raw.githubusercontent.com/SpiffyUp/spiffy-zsh/main/spiffy-zsh.zsh-theme -o "\$HOME/.oh-my-zsh/custom/themes/spiffy-zsh.zsh-theme"

# Set the spiffy-zsh theme in the .zshrc file
echo "Setting spiffy-zsh as the default theme..."
sed -i.bak 's/^ZSH_THEME=.*/ZSH_THEME="spiffy-zsh"/' "\$HOME/.zshrc"

# Source .zshrc to apply the changes
echo "Applying the changes..."
source "\$HOME/.zshrc"

echo "Installation complete! Enjoy your new zsh setup with the spiffy-zsh theme."