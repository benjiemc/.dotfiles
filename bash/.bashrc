# User specific aliases and functions
# Everyone needs a little color in their lives
color() {
    echo "\e[38;5;${1}m"
}
GREEN="$(color 41)"
YELLOW="$(color 11)"
BLUE="$(color 27)"
PURPLE='\[\e[0;35m\]'
CYAN="$(color 45)"
WHITE="$(color 255)"
NIL='\[\e[00m\]'
function git_branch() {
    # -- Finds and outputs the current branch name by parsing the list of
    #    all branches
    # -- Current branch is identified by an asterisk at the beginning
    # -- If not in a Git repository, error message goes to /dev/null and
    #    no output is produced
    git branch --no-color 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}
function git_status() {
    # Outputs a series of indicators based on the status of the
    # working directory:
    # + changes are staged and ready to commit
    # ! unstaged changes are present
    # ? untracked files are present
    # S changes have been stashed
    # P local commits need to be pushed to the remote
    local status
    local output
    status="$(git status --porcelain 2>/dev/null)"
    output=''
    egrep -q '^[MADRC]' <<<"$status" && output="$output+"
    egrep -q '^.[MD]' <<<"$status" && output="$output!"
    [[ -n $output ]] && output="$output"  # separate from branch name
    echo $output
}
function git_color() {
    # Receives output of git_status as argument; produces appropriate color
    # code based on status of working directory:
    # - White if everything is clean
    # - Green if all changes are staged
    # - Yellow if there are both staged and unstaged changes
    local staged
    local dirty
    staged=$([[ $1 =~ \+ ]] && echo yes)
    dirty=$([[ $1 =~ [!\?] ]] && echo yes)
    if [[ -n $staged ]]; then
        echo -e "${GREEN}"  # bold green
    elif [[ -n $dirty ]]; then
        echo -e "${YELLOW}"  # bold red
    else
        echo -e "${WHITE}"  # bold white
    fi
}
function git_prompt() {
    # First, get the branch name...
    local branch
    local state
    local color
    branch=$(git_branch)
    # Empty output? Then we're not in a Git repository, so bypass the rest
    # of the function, producing no output
    if [[ -n "$branch" ]]; then
        state=$(git_status)
        color=$(git_color "$state")
        # Now output the actual code to insert the branch and status
        echo -e "$color[git: $branch]${NIL}"  # last bit resets color
    fi
}
function set_prompt() {
    host="${BLUE}\h${NIL}"
    path="${CYAN}\w${NIL}"
    myuser="${GREEN}\u${NIL}"
    end="${NIL}> "
    venv=""
    if [[ -n "$VIRTUAL_ENV" ]]; then
        venv="${PURPLE}(${VIRTUAL_ENV##*/})${NIL}"
    fi
    PS1="${myuser}@${host} ${path} $(git_prompt) ${venv} ${NIL}\n${end}"
    export PS1
}

# Aliases
unamestr=$(uname)
if [[ "$unamestr" == "Linux" ]]; then
    alias ls='ls --color --group-directories-first'
elif [[ "$unamestr" == "Darwin" ]]; then
    export PATH=$HOME/bin/:$HOME/bin/brew/bin:$HOME/Library/Python/2.7/bin:$PATH
    alias ls='gls --color --group-directories-first'
fi
alias ll='ls -l'
# ignore some patterns for the basic tree command
alias treeall='tree --dirsfirst -C -I ".git"'
alias tree="tree --dirsfirst -C -I \".git|*.pyc|*.egg-info|build|__pycache__|venv*|deps|_build|node_modules|vendor\""
if [[ :$PATH: != *:"~/.local/bin":* ]] ; then
    export PATH=~/.local/bin:$PATH
fi
