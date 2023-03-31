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

# Download and install the spiffy-zhann theme
echo "Installing spiffy-zhann theme..."
curl -fsSL https://gist.githubusercontent.com/jeremyabraham7/d796f2b39ab75b0aedbc0a14532d2773/raw/spiffy-zhann.zsh-theme -o "\$HOME/.oh-my-zsh/custom/themes/spiffy-zhann.zsh-theme"

# Set the spiffy-zhann theme in the .zshrc file
echo "Setting spiffy-zhann as the default theme..."
sed -i.bak 's/^ZSH_THEME=.*/ZSH_THEME="spiffy-zhann"/' "\$HOME/.zshrc"

# Source .zshrc to apply the changes
echo "Applying the changes..."
source "\$HOME/.zshrc"

echo "Installation complete! Enjoy your new zsh setup with the spiffy-zhann theme."
EOL

# Execute the temporary script with zsh
zsh "$TEMP_SCRIPT"

# Remove the temporary script
rm -f "$TEMP_SCRIPT"