# https://github.com/SpiffyUp/spiffy-zsh-theme
# Load the vcs_info module for version control system information
autoload -Uz vcs_info

# Set the stagedstr style to display a green dot for staged changes
zstyle ':vcs_info:*' stagedstr '%F{green}●'
# Set the unstagedstr style to display a yellow dot for unstaged changes
zstyle ':vcs_info:*' unstagedstr '%F{yellow}●'
# Enable checking for changes in the working tree
zstyle ':vcs_info:*' check-for-changes true
# Set the branchformat for SVN to display only the branch name
zstyle ':vcs_info:svn:*' branchformat '%b'
# Set the format for displaying SVN repository information
zstyle ':vcs_info:svn:*' formats ' [%b%F{1}:%F{11}%i%c%u%B%F{green}]'
# Enable vcs_info for Git and SVN repositories
zstyle ':vcs_info:*' enable git svn

# Define a function to be called before each prompt display
theme_precmd () {
  # Check if there are untracked files in the Git repository
  if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    # Set the Git format without a red dot when there are no untracked files
    zstyle ':vcs_info:git:*' formats ' [%b%c%u%B%F{green}]'
  else
    # Set the Git format with a red dot when there are untracked files
    zstyle ':vcs_info:git:*' formats ' [%b%c%u%B%F{red}●%F{green}]'
  fi

  # Update the version control system information
  vcs_info
}

# Check if the shell session is an SSH session
if [[ ${SSH_TTY} ]] ; then
  # Set the hostname variable with a specific color when in an SSH session
  local hostname="%{$FG[214]%}%m"
else
  # Set the hostname variable as an empty string when not in an SSH session
  local hostname=""
fi

# Enable prompt string substitution
setopt prompt_subst
# Define the prompt format including hostname, path, VCS info, and colors
PROMPT='${hostname} %B%F{blue}%c%B%F{green}${vcs_info_msg_0_}%B%F{magenta} %{$reset_color%}% '

# Load the add-zsh-hook function for adding functions to hooks
autoload -U add-zsh-hook
# Add the theme_precmd function to the precmd hook, so it's called before each prompt
add-zsh-hook precmd  theme_precmd
