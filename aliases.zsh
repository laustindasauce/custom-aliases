alias aliases="code ~/.oh-my-zsh/custom" # Open custom folder to edit/view aliases
alias clr="clear" # Clear your terminal screen
alias ip="curl icanhazip.com" # Your public IP address
alias ll="ls -al" # List all files in current directory in long list format
alias ldir="ls -al | grep ^d" # List all directories in current directory in long list format
alias o="open ." # Open the current directory in Finder
alias ut="uptime" # Computer uptime
alias up="cd .." # Go to one directory up
alias back="cd -" # Go to previous directory
alias dirnm='echo ${PWD##*/}' # Get name of current folder

### Python aliases 

alias python="python3" # Set alias for python to default to python 3
alias pip="/usr/local/bin/python3 -m pip" # Set alias for pip installs to go to python 3
alias py-activate='echo -n "env name: " && read env_name && source "$env_name"/bin/activate' # Set alias to activate local environments

### Go aliases

alias godoc="~/go/bin/godoc"
alias godoc-web"~/go/bin/godoc -http=:6060"
alias gocmt="~/go/bin/gocmt"
alias air="~/go/bin/air"
alias swag="~/go/bin/swag"

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

# Prune the remote origin
alias gpro='git remote prune origin'

# Test which branches would be deleted if you run gpro
alias gprot='git remote prune origin --dry-run'

# Prune orphaned/unused branches
alias gp='git prune'

alias gba='git branch -a'

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

alias tag='
echo -n "tagname: " && read tag && git tag "$tag"
git push origin --tags
'

alias tag-a='
echo -n "tagname: " && read tag
echo -n "annotation: " && read ant && git tag "$tag" -a "$ant"
'

# alias def='
# git symbolic-ref refs/remotes/origin/HEAD | sed "s@^refs/remotes/origin/@@"'

# alias bclean="
# !f() { DEFAULT=$(def); git branch --merged ${1-$DEFAULT} | grep -v ' ${1-$DEFAULT}$' | xargs git branch -d; }; f"

# alias bdone = "!f() { DEFAULT=$(def); git checkout ${1-$DEFAULT} && git up && git bclean ${1-$DEFAULT}; }; f"

# Adding Meteor shortcut since download not working properly on M1
alias meteor='/usr/local/bin/launch-meteor'
alias github='cd ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Documents/GitHub/'

# Adding various shortcuts to cloud docs
alias cloud='cd ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/'
# alias school='cd ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Documents/SCHOOL'
alias work='cd ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Documents/WORK'

# alias pushschool='
# cd ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Documents/SCHOOL/semesters
# echo -n "Please enter semester: " && read curr
# for d in "$curr"/*/

# do
#     (cd "$d" && savepush
#     # if git diff-index --quiet HEAD --; then
#     #     echo "No changes to commit in $d"
#     # else
#     #     savepush
#     # fi
#     )
# done
# '

# alias fpschool='
# cd ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Documents/SCHOOL/semesters
# echo -n "Please enter semester: " && read curr
# for d in "$curr"/*/

# do
#     (cd "$d" && fp)
# done
# '

alias redis='~/Documents/Documents\ -\ Austin’s\ Mac\ mini/Redis/redis-6.2.5/src/redis-server'
alias redis-cli='~/Documents/Documents\ -\ Austin’s\ Mac\ mini/Redis/redis-6.2.5/src/redis-cli'


# postgresql
alias postgresql-start='brew services start postgresql@13'
alias postgresql-stop='brew services stop postgresql@13'

# kubectl
alias kontext='echo -n "dev or prod: " && read msg && kubectl config use-context guldentech-"$msg"'

# concourse
alias fly-pipe='fly -t guldentech set-pipeline \
	-p ${PWD##*/} \
	-c  /Users/austinspencer/GitHub/build-deploy.yml \
	--team=austin-spencer \
	-l ci/variables.yaml
'
