bash
#!/bin/sh

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install zsh if not already installed
if ! command_exists zsh; then
    echo "Installing zsh..."
    if command_exists apt-get; then
        sudo apt-get update && sudo apt-get install -y zsh
    elif command_exists yum; then
        sudo yum install -y zsh
    elif command_exists pacman; then
        sudo pacman -S zsh
    else
        echo "Could not find a package manager. Please install zsh manually."
        exit 1
    fi
fi

# Set zsh as the default shell
if [ "$(basename "$SHELL")" != "zsh" ]; then
    echo "Setting zsh as the default shell..."
    chsh -s "$(command -v zsh)"
    echo "Note: You may need to log out and back in for the changes to take effect."
fi

# Create a temporary script file to install oh-my-zsh and the theme
TEMP_SCRIPT=$(mktemp "/tmp/temp_zsh_install_XXXXXX")

cat > "$TEMP_SCRIPT" << EOL
#!/bin/zsh

# Install oh-my-zsh if not already installed
if [ ! -d "\$HOME/.oh-my-zsh" ]; then
    echo "Installing oh-my-zsh..."
    sh -c "\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

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
EOL

# Execute the temporary script with zsh
zsh "$TEMP_SCRIPT"

# Remove the temporary script
rm -f "$TEMP_SCRIPT"