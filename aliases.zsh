alias aliases="code ~/.oh-my-zsh/custom" # Open custom folder to edit/view aliases
alias clr="clear" # Clear your terminal screen
alias ip="curl icanhazip.com" # Your public IP address
alias ll="ls -al" # List all files in current directory in long list format
alias ldir="ls -al | grep ^d" # List all directories in current directory in long list format
alias o="open ." # Open the current directory in Finder
alias ut="uptime" # Computer uptime
alias up="cd .." # Go to one directory up
alias back="cd -" # Go to previous directory

### NPM issue
# alias npm="/usr/local/bin/npm" # Set alias for npm command

### Redis
alias redis="/Users/austinspencer/Documents/redis/redis-6.0.4/src/redis-server"

### Python aliases 

alias python="python3" # Set alias for python to default to python 3
alias pip="/usr/local/bin/python3 -m pip" # Set alias for pip installs to go to python 3

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

# GitHub Status command
alias gs='git status'

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

# Checkout with a new branch and push to remote repository
alias cobp='
echo -n "Branch Name: " && read branch && git checkout -b $branch && git push --set-upstream origin $branch
'

alias save='
git add -A
git commit -m "SAVEPOINT"
'

alias savepush='
git add -A
git commit -m "SAVEPOINT"
git push
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

# Adding Meteor shortcut since download not working properly on M1
alias run-meteor='/usr/local/bin/launch-meteor run'
alias cmd-meteor='/usr/local/bin/launch-meteor'
alias github='cd ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Documents/GitHub/'

# Adding various shortcuts to cloud docs
alias cloud='cd ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/'
alias school='cd ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Documents/SCHOOL'
alias work='cd ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Documents/WORK'

alias pushschool='
cd ~/Documents/SCHOOL/semesters
echo -n "Please enter semester: " && read curr
for d in "$curr"/*/

do
    (cd "$d" && savepush
    # if git diff-index --quiet HEAD --; then
    #     echo "No changes to commit in $d"
    # else
    #     savepush
    # fi
    )
done
'

alias fpschool='
cd ~/Documents/SCHOOL/semesters
echo -n "Please enter semester: " && read curr
for d in "$curr"/*/

do
    (cd "$d" && fp)
done
'
