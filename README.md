# Zsh and Spiffy-zhann Theme Installer

This script automates the installation of zsh, oh-my-zsh, and the spiffy-zhann theme. It also sets zsh as the default shell for the current user.

![Theme Preview](https://user-images.githubusercontent.com/18311021/228988323-e8e386ac-a9a2-455a-b99a-de5365e10a82.png)

## Requirements

The script should work on most Unix-based systems (Linux and macOS) with any of the following package managers:

- apt-get (e.g., Debian, Ubuntu)
- yum (e.g., CentOS, RHEL)
- pacman (e.g., Arch Linux, Manjaro)

## Installation Instructions

1. Open a terminal.

2. Download and execute the script using the following command:

   ```bash
   curl -fsSL https://gist.githubusercontent.com/jeremyabraham7/d796f2b39ab75b0aedbc0a14532d2773/raw/full-install.sh | bash
   ```

3. The script will automatically install zsh, oh-my-zsh, and the spiffy-zhann theme (if not already installed), and set zsh as the default shell for the current user.

4. Log out and back in to activate the new zsh session with the spiffy-zhann theme.

## Troubleshooting

If you encounter any issues, please check the following:

- Ensure you have a supported package manager (apt-get, yum, or pacman) installed on your system.
- Ensure you have an active internet connection to download the required packages and theme.
- If the default shell is not changed after logging out and back in, try manually changing the shell by running `chsh -s $(command -v zsh)`.

If you still encounter issues, consider opening an issue in the repository where the script is hosted or seeking assistance from the respective package manager or zsh communities.