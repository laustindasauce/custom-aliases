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
# alias pip="/usr/bin/python3 -m pip" # Set alias for pip installs to go to python 3
alias py-activate='echo -n "env name: " && read env_name && source "$env_name"/bin/activate' # Set alias to activate local environments
alias freeze="python -m pip freeze > requirements.txt"

### Go aliases

alias godoc-web="godoc -http=:6060"
alias swag-air="swag init --parseDependency  --parseInternal --parseDepth 1 -g main.go && air"

### SSH aliases

alias ssh-mrpi='ssh "$MRPI_USER"@"$MRPI_IP"'
alias ssh-rpi='ssh "$RPI_USER"@"$RPI_IP"'
alias ssh-e800='ssh "$E800_USER"@"$E800_IP"'

### Git Flow aliases

# Removed to opt for the git-flow plugin:
alias gflu='
co main
git push
git push --tags
co develop
git push
'
# alias gcd='git checkout $(git config gitflow.branch.develop)'
# alias gch='git checkout $(git config gitflow.prefix.hotfix)'
# alias gcr='git checkout $(git config gitflow.prefix.release)'
# alias gfl='git flow'
# alias gflf='git flow feature'
# alias gflff='git flow feature finish'
# alias gflffc='git flow feature finish ${$(git_current_branch)#feature/}'
# alias gflfp='git flow feature publish'
# alias gflfpc='git flow feature publish ${$(git_current_branch)#feature/}'
# alias gflfpll='git flow feature pull'
# alias gflfs='git flow feature start'
# alias gflh='git flow hotfix'
# alias gflhf='git flow hotfix finish'
# alias gflhfc='git flow hotfix finish ${$(git_current_branch)#hotfix/}'
# alias gflhp='git flow hotfix publish'
# alias gflhpc='git flow hotfix publish ${$(git_current_branch)#hotfix/}'
# alias gflhs='git flow hotfix start'
# alias gfli='git flow init'
# alias gflr='git flow release'
# alias gflrf='git flow release finish'
# alias gflrfc='git flow release finish ${$(git_current_branch)#release/}'
# alias gflrp='git flow release publish'
# alias gflrpc='git flow release publish ${$(git_current_branch)#release/}'
# alias gflrs='git flow release start'


### Git aliases

# Clone shortcut
alias gc='git clone'

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
git commit -m "SAVEPOINT $(date)"
'

alias savepush='
git add -A
git commit -m "SAVEPOINT $(date)"
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

alias updt-api-dev-rsync='
rm ~/github/bots-api-dev/go.mod
rm ~/github/bots-api-dev/go.sum
rsync -a --delete ~/github/bots-api/internal/. ~/github/bots-api-dev/internal/
rsync -a --delete ~/github/bots-api/pkg/. ~/github/bots-api-dev/pkg/
rsync -a --delete ~/github/bots-api/platform/. ~/github/bots-api-dev/platform/
rsync -a --delete ~/github/bots-api/config/. ~/github/bots-api-dev/config/
rsync -a --delete ~/github/bots-api/scripts/. ~/github/bots-api-dev/scripts/
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
# alias kontext='echo -n "context: " && read msg && kubectl config use-context "$msg"'
alias kontext='kubectl config use-context '
alias kontext-gke='kubectl config use-context gke_austinbspencer_us-central1_main-cluster'

# concourse
alias fly-login='fly -t guldentech login \
	--team-name austin-spencer \
	--concourse-url https://concourse2.guldentech.com
'
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
alias redis='sudo service redis-server start'
alias redis-stop='sudo service redis-server stop'
alias redis-restart='sudo service redis-server restart'

# Postgresql
alias postgres='sudo su - postgres'

# Intellij
alias intellij='~/idea-IC-222.4345.14/bin/idea.sh &'

# Linux updates
alias update='sudo apt-get update && sudo apt-get upgrade'
alias exp='explorer.exe .'

# Windows shortcuts
alias open="explorer.exe"
alias pbcopy="clip.exe"

# # Docker shortcuts
# Docker shortcuts function
dcpu_function() {
  local container="$1"
  docker compose pull "$container" && docker compose up -d "$container"
}

# Alias to call the function
alias dcpu='dcpu_function'
alias dcpua='docker compose pull && docker compose up -d'
