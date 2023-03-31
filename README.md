# Spiffy-Zsh Theme + Zsh Installer

This script automates the installation of zsh, oh-my-zsh, and the spiffy-zsh theme, which is a modified version of the popular oh-my-zsh theme called "zhann." The spiffy-zsh theme specifically adds functionality to display the current hostname when connected to a remote host. This helps to clearly identify the environment you're working in, minimizing the risk of unintended actions in the wrong environment.

![Theme Preview](https://user-images.githubusercontent.com/18311021/228988323-e8e386ac-a9a2-455a-b99a-de5365e10a82.png)

## Requirements

The script should work on most Unix-based systems (Linux and macOS) with any of the following package managers:

- apt-get (e.g., Debian, Ubuntu)
- yum (e.g., CentOS, RHEL)
- pacman (e.g., Arch Linux, Manjaro)

## Installation

Spiffy-Zsh is installed by running the following command in your terminal. The main installer will automatically install zsh, oh-my-zsh, and the spiffy-zsh theme (if not already installed), and set zsh as the default shell for the current user.

   ```bash
   curl -fsSL https://raw.githubusercontent.com/SpiffyUp/spiffy-zsh/main/tools/install.sh | bash
   ```

You may need to log out and back in to activate the new zsh session with the spiffy-zsh theme.

## Troubleshooting

If you encounter any issues, please check the following:

- Ensure you have a supported package manager (apt-get, yum, or pacman) installed on your system.
- Ensure you've restarted your terminal/logged out and back in to see the changes
- If the default shell is not changed after logging out and back in, try manually changing the shell by running `chsh -s $(command -v zsh)`.

If you still encounter issues, consider opening an issue here or seeking assistance from the respective package manager or zsh communities.