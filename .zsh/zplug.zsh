# Plug OMZ plugins
zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh"

zplug "plugins/aws",   from:oh-my-zsh, defer:1
zplug "plugins/brew",   from:oh-my-zsh, defer:1
zplug "plugins/cask",   from:oh-my-zsh, defer:1
zplug "plugins/colored-man-pages",   from:oh-my-zsh, defer:1
zplug "plugins/colorize",   from:oh-my-zsh, defer:1
zplug "plugins/command-not-found",   from:oh-my-zsh, defer:1
zplug "plugins/common-aliases",   from:oh-my-zsh, defer:1
zplug "plugins/fancy-ctrl-z",   from:oh-my-zsh, defer:1
zplug "plugins/docker",   from:oh-my-zsh, defer:1
zplug "plugins/docker-compose",   from:oh-my-zsh, defer:1
zplug "plugins/encode64",   from:oh-my-zsh, defer:1
zplug "plugins/git",   from:oh-my-zsh, defer:1
#zplug "plugins/git-escape-magic",   from:oh-my-zsh, defer:1
zplug "plugins/git-extras",   from:oh-my-zsh, defer:1
zplug "plugins/git-flow",   from:oh-my-zsh, defer:1
zplug "plugins/git-hubflow",   from:oh-my-zsh, defer:1
zplug "plugins/git-prompt",   from:oh-my-zsh, defer:1
zplug "plugins/github",   from:oh-my-zsh, defer:1
zplug "plugins/gitignore",   from:oh-my-zsh, defer:1
zplug "plugins/gnu-utils",   from:oh-my-zsh, defer:1
zplug "plugins/golang",   from:oh-my-zsh, defer:1
zplug "plugins/gpg-agent",   from:oh-my-zsh, defer:1
zplug "plugins/history",   from:oh-my-zsh, defer:1
zplug "plugins/httpie",   from:oh-my-zsh, defer:1
zplug "plugins/iterm2",   from:oh-my-zsh, defer:1
zplug "plugins/jira",   from:oh-my-zsh, defer:1
zplug "plugins/man",   from:oh-my-zsh, defer:1
zplug "plugins/node",   from:oh-my-zsh, defer:1
zplug "plugins/npm",   from:oh-my-zsh, defer:1
#zplug "plugins/npx",   from:oh-my-zsh, defer:1
#zplug "plugins/nvm",   from:oh-my-zsh, defer:1
zplug "plugins/osx",   from:oh-my-zsh, defer:1
zplug "plugins/otp",   from:oh-my-zsh, defer:1
zplug "plugins/pass",   from:oh-my-zsh, defer:1
zplug "plugins/pipenv",   from:oh-my-zsh, defer:1
zplug "plugins/ripgrep",   from:oh-my-zsh, defer:1
zplug "plugins/rsync",   from:oh-my-zsh, defer:1
zplug "plugins/shrink-path",   from:oh-my-zsh, defer:1
zplug "plugins/ssh-agent",   from:oh-my-zsh, defer:1
zplug "plugins/terraform",   from:oh-my-zsh, defer:1
zplug "plugins/textmate",   from:oh-my-zsh, defer:1
zplug "plugins/thefuck",   from:oh-my-zsh, defer:1
zplug "plugins/tig",   from:oh-my-zsh, defer:1
zplug "plugins/timer",   from:oh-my-zsh, defer:1
zplug "plugins/vi-mode",   from:oh-my-zsh, defer:1
zplug "plugins/web-search",   from:oh-my-zsh, defer:1
zplug "plugins/z",   from:oh-my-zsh, defer:1
zplug "plugins/zsh-navigation-tools", from:oh-my-zsh, defer:1
zplug "plugins/zsh_reload", from:oh-my-zsh, defer:1

zplug "zsh-users/zsh-apple-touchbar"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions", use:src
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"

# Plug other plugins
zplug "MichaelAquilina/zsh-you-should-use"
zplug "Tarrasch/zsh-autoenv"
zplug "b4b4r07/enhancd", use:init.sh
zplug "b4b4r07/emoji-cli", as:command
zplug "b4b4r07/httpstat", as:command, use:'(*).sh', rename-to:'$1'
zplug "b4b4r07/zsh-vimode-visual", use:"*.zsh", defer:3
zplug "chrissicool/zsh-256color"
zplug "ndbroadbent/scm_breeze", hook-build:"$ZPLUG_REPOS/ndbroadbent/scm_breeze/install.sh"
zplug "supercrabtree/k"

# Plug completions
zplug "esc/conda-zsh-completion"
#zplug "glidenote/hub-zsh-completion"
#zplug "pyinvoke/invoke", use:"completion/"
zplug "srijanshetty/zsh-pip-completion"
zplug 'Valodim/zsh-curl-completion'

# Plug shell scripts or small programs
zplug "BurntSushi/ripgrep", from:gh-r, as:command, rename-to:rg, at:0.5.2
zplug "b4b4r07/httpstat", as:command, use:'(*).sh', rename-to:'$1'
zplug "junegunn/fzf", as:command, use:bin/fzf-tmux
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf, use:"*darwin*amd64*", frozen:1
zplug "k4rthik/git-cal", as:command
zplug "mszostok/codeowners-validator", from:gh-r, as:command, use:"*Darwin*x86_64*"
zplug "cli/cli", from:gh-r, as:command, use:cli, rename-to:gh
zplug "paulirish/git-open", as:command
zplug "peco/peco", as:command, from:gh-r, frozen:1
zplug "rmax-contrib/gister", as:command, use:gister.sh, rename-to:gister
zplug "so-fancy/diff-so-fancy", as:command
zplug "stedolan/jq", from:gh-r, as:command, rename-to:jq

# Plug theme
zplug "oskarkrawczyk/honukai-iterm-zsh", as:theme

# Powerline
#zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme

# Node stack

# Openapi
zplug "xavierchow/vim-swagger-preview", use:.zshenv

zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

zplug "romkatv/powerlevel10k", as:theme

zplug "erikw/tmux-powerline"
