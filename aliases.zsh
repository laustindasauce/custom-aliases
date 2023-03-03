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
alias kill-port='echo -n "port: " && read port && fuser -k "$port"/tcp'

### Python aliases 

alias python="python3" # Set alias for python to default to python 3
alias pip="/usr/local/bin/python3 -m pip" # Set alias for pip installs to go to python 3
alias py-activate='echo -n "env name: " && read env_name && source "$env_name"/bin/activate' # Set alias to activate local environments
alias freeze="python -m pip freeze > requirements.txt"

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

alias refresh='
git checkout main
git fetch
git pull
git branch -d dev
git checkout -b dev
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

alias updt-api-dev='
rm -r ~/github/bots-api-dev/internal
rm -r ~/github/bots-api-dev/pkg
rm -r ~/github/bots-api-dev/platform
rm -r ~/github/bots-api-dev/config
rm -r ~/github/bots-api-dev/scripts
rm ~/github/bots-api-dev/go.mod
rm ~/github/bots-api-dev/go.sum
cp -a ~/github/bots-api/internal/. ~/github/bots-api-dev/internal/
cp -a ~/github/bots-api/pkg/. ~/github/bots-api-dev/pkg/
cp -a ~/github/bots-api/platform/. ~/github/bots-api-dev/platform/
cp -a ~/github/bots-api/config/. ~/github/bots-api-dev/config/
cp -a ~/github/bots-api/scripts/. ~/github/bots-api-dev/scripts/
cp ~/github/bots-api/go.mod ~/github/bots-api-dev/go.mod
cp ~/github/bots-api/go.sum ~/github/bots-api-dev/go.sum
cd ~/github/bots-api-dev
go mod tidy
swag init --parseDependency --parseInternal
git add .
git commit -m "update from main"
git push
back
'

alias github='cd ~/github/'

# kubectl
alias kontext='echo -n "dev or prod: " && read msg && kubectl config use-context guldentech-"$msg"'

# concourse
alias fly-pipe='fly -t guldentech set-pipeline \
	-p ${PWD##*/} \
	-c  ~/github/concourse-pipelines/pipelines/build-deploy.yaml \
	--team=austin-spencer \
	-l ci/variables.yaml
'
# Fly pipe with no versioning
alias fly-pipe-nv='fly -t guldentech set-pipeline \
	-p ${PWD##*/} \
	-c  ~/github/concourse-pipelines/pipelines/build-deploy-no-versioning.yaml \
	--team=austin-spencer \
	-l ci/variables.yaml
'

# Kitty terminal customization
alias kitheme='
echo -n "theme: " && read theme
THEME=https://raw.githubusercontent.com/dexpota/kitty-themes/master/themes/"$theme".conf && 
wget "$THEME" -P ~/.config/kitty/kitty-themes/themes && 
rm ~/.config/kitty/theme.conf && 
ln -s ~/.config/kitty/kitty-themes/themes/"$theme".conf ~/.config/kitty/theme.conf
'

# Redis
alias redis='sudo systemctl start redis'
alias redis-stop='sudo systemctl stop redis'
alias redis-restart='sudo systemctl restart redis'
alias redis-enable='sudo systemctl enable redis'


# Postgresql
alias postgres='sudo su - postgres'

# Intellij
alias intellij='~/idea-IC-222.4345.14/bin/idea.sh &'

# Linux updates
alias update='sudo apt-get update && sudo apt-get upgrade'
