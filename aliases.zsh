alias aliases="code ~/.oh-my-zsh/custom" # Open custom folder to edit/view aliases
alias clr="clear" # Clear your terminal screen
alias ip="curl icanhazip.com" # Your public IP address
alias ll="ls -al" # List all files in current directory in long list format
alias ldir="ls -al | grep ^d" # List all directories in current directory in long list format
alias o="open ." # Open the current directory in Finder
alias ut="uptime" # Computer uptime
alias up="cd .." # Go to one directory up
alias back="cd -" # Go to previous directory

### Git aliases

# Add all changes and commit with specified comment
alias gac='
git add .
echo -n "Commit message: " && read msg && git commit -m "$msg"
'

# Same as previous just push after
alias gacp='
git add .
echo -n "Commit message: " && read msg && git commit -m "$msg"
git push
'

# Delete specified branch
alias dob="git branch -d" # Already have gbD which is git branch -D

# Setting main as the default
alias init-main='
git branch main
git checkout main
git push --set-upstream origin main
echo -n "Please enter name of previous branch: " && read curr && git branch -d $curr
'

# Fetch and pull updates
alias fp='
git fetch
git pull --rebase
'

# Search commits
alias fresh='
git pull --rebase --prune
git submodule update --init --recursive
'

alias co='git checkout' # Checkout branch

alias cob='git checkout -b' # Checkout with a new branch expected branch name (ex. cob newBranch)

alias save='
git add -A
git commit -m "SAVEPOINT"
'

alias wipe='
git add -A
git commit -qm "WIPE SAVEPOINT"
git reset HEAD~1 --hard
'

# alias def='
# git symbolic-ref refs/remotes/origin/HEAD | sed "s@^refs/remotes/origin/@@"'

# alias bclean="
# !f() { DEFAULT=$(def); git branch --merged ${1-$DEFAULT} | grep -v ' ${1-$DEFAULT}$' | xargs git branch -d; }; f"

# alias bdone = "!f() { DEFAULT=$(def); git checkout ${1-$DEFAULT} && git up && git bclean ${1-$DEFAULT}; }; f"
