# GitHub_4_Linux

This Repository will contain all the necessary files and setup instruction to fully utilize Linux's available tools to better use GitHub.

## [IMPORTANT] Critical Information

The `.bashrc` setup assumes that the Folder containing your GitHub Repositories that you wish to update frequently/manually is located at `~/_gitHubRepo`. Feel free to change it accordingly if you'd like!

## (Optional) Pip Installations

> pip install Pygments

## .bashrc Setup

Locate your `.bashrc` file within your Linux user directory, and add the following alias...

> alias \_help='pygmentize -g ~/\_gitHubRepo/GitHub_4_Linux/.helpCommands'
> alias gith='pygmentize -g ~/\_gitHubRepo/GitHub_4_Linux/.gitWorkflowCmds'
> alias gitrepo='cd ~/\_gitHubRepo'
> alias gitl='git log --graph --oneline --decorate'
> alias gitupdate='~/\_gitHubRepo/GitHub_4_Linux/git_update_all.sh'

## [IMPORTANT]

Ensure that `git_update_all.sh` is executable.

> chmod +x git_update_all.sh
