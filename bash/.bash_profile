
# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/Applications/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/Applications/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/Applications/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/Applications/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="$HOME/Applications/flutter/bin:$PATH"
export PATH="$HOME/Applications/Android/bin:$PATH"


# ignore some patterns for the basic tree command --> done in .zshrc
# alias treeall='tree --dirsfirst -C -I ".git"'
# alias tree="tree --dirsfirst -C -I \".git|*.pyc|*.egg-info|build|__pycache__|venv*|deps|_build|node_modules|vendor\""
if [[ :$PATH: != *:"~/.local/bin":* ]] ; then
    export PATH=~/.local/bin:$PATH
fi

source ~/.bashrc
