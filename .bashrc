ulimit -n 2048
# Bash
export EDITOR='mvim -v -N'

# Setting for the new UTF-8 terminal support in Lion
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_LANG=en_US.UTF-8
export LANG=en_US.UTF-8

# Git
source /usr/local/etc/bash_completion.d/git-completion.bash
export GIT_EDITOR='vim'
export PATH=$PATH:/usr/local/git/bin

#go
export GOPATH=$HOME/Go
export PATH=$PATH:$GOPATH/bin
# Functions

# Serve the current directory over HTTP
function serve {
  port="${1:-9000}"
  ruby -r webrick -e "s = WEBrick::HTTPServer.new(:Port => $port,
   :DocumentRoot => Dir.pwd); trap('INT') { s.shutdown }; s.start"
}

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "("${ref#refs/heads/}") "
}

# Homebrew
export PATH=/usr/local/sbin:/usr/local/bin:$PATH

# Ruby
export GUARD_NOTIFY=false
export RUBY_GC_HEAP_INIT_SLOTS=1800000  # (10000)
export RUBY_HEAP_FREE_MIN=20000         # (4096)
export RUBY_HEAP_SLOTS_INCREMENT=300000 # (10000)
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1  # (1.8)
export RUBY_GC_MALLOC_LIMIT=85000000    # (8000000)

# Rubinius
export RBXOPT=-X19

# Colors!
export CLICOLOR=1
export LSCOLORS=HxbxfxdxCxegedafahacad
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;35;40'
# Load aliases
[[ -s "$HOME/.aliases" ]] && source "$HOME/.aliases"

#load my bins
export PATH="$HOME/bin:$PATH"

#load rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# set mule home
export MULE_HOME=$HOME/apps/mule-standalone-3.3.1

PERL_MB_OPT="--install_base \"/Users/saebdal/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/saebdal/perl5"; export PERL_MM_OPT;

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# added by travis gem
[ -f /Users/saebdal/.travis/travis.sh ] && source /Users/saebdal/.travis/travis.sh
