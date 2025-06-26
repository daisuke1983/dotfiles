#Homebrew
eval $(/opt/homebrew/bin/brew shellenv)

# nodeenv
eval "$(nodenv init -)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# zsh-completions
# 補完機能を有効にする
autoload -Uz compinit
compinit
# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
fpath=(/usr/local/share/zsh-completions $fpath)

# zsh-completions
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi

# zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# あたらしくインストールされたコマンドを即認識させる
zstyle ":completion:*:commands" rehash 1

# Alias
alias pn=pnpm
alias kc=kubectl

export PATH="/Users/daisuke/.local/share/solana/install/active_release/bin:$PATH"
