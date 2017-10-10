# Plug OMZ plugins
zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh"
zplug "plugins/aws",   from:oh-my-zsh, defer:1
zplug "plugins/fancy-ctrl-z",   from:oh-my-zsh, defer:1
zplug "plugins/git",   from:oh-my-zsh, defer:1
zplug "plugins/history",   from:oh-my-zsh, defer:1
zplug "plugins/httpie",   from:oh-my-zsh, defer:1
zplug "plugins/rsync",   from:oh-my-zsh, defer:1
zplug "plugins/shrink-path",   from:oh-my-zsh, defer:1
zplug "plugins/ssh-agent",   from:oh-my-zsh, defer:1
zplug "plugins/vi-mode",   from:oh-my-zsh, defer:1
zplug "plugins/z",   from:oh-my-zsh, defer:1
zplug "plugins/zsh-navigation-tools", from:oh-my-zsh, defer:1

# Plug other plugins
zplug "MichaelAquilina/zsh-you-should-use"
zplug "Tarrasch/zsh-autoenv"
zplug "b4b4r07/enhancd", use:init.sh
zplug "b4b4r07/zsh-vimode-visual", use:"*.zsh", defer:3
zplug "chrissicool/zsh-256color"
zplug "ndbroadbent/scm_breeze", hook-build:"$ZPLUG_REPOS/ndbroadbent/scm_breeze/install.sh"
zplug "pyinvoke/invoke", use:"completion/zsh"
zplug "srijanshetty/zsh-pip-completion"
zplug "supercrabtree/k"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"

# Plug completions
zplug "esc/conda-zsh-completion"
zplug "glidenote/hub-zsh-completion"
zplug "srijanshetty/zsh-pip-completion"
zplug "zsh-users/zsh-completions", use:src
zplug 'Valodim/zsh-curl-completion'

# Plug shell scripts or small programs
zplug "BurntSushi/ripgrep", from:gh-r, as:command, rename-to:rg, at:0.5.2
zplug "b4b4r07/httpstat", as:command, use:'(*).sh', rename-to:'$1'
zplug "junegunn/fzf", as:command, use:bin/fzf-tmux
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf, use:"*darwin*amd64*", frozen:1
zplug "k4rthik/git-cal", as:command
zplug "paulirish/git-open", as:command
zplug "peco/peco", as:command, from:gh-r, frozen:1
zplug "rmax-contrib/gister", as:command, use:gister.sh, rename-to:gister
zplug "so-fancy/diff-so-fancy", as:command
zplug "stedolan/jq", from:gh-r, as:command, rename-to:jq
# TODO: Check always for release. For now we stick at the prerelease as zplug
# defaults to the latest release.
zplug "github/hub", from:gh-r, as:command, at:v2.3.0-pre10, frozen:1

# Plug theme
zplug "oskarkrawczyk/honukai-iterm-zsh", as:theme
