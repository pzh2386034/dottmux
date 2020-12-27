# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

ANTIGEN="$HOME/wks/antigen/antigen.zsh"

source "$ANTIGEN"
antigen use prezto
antigen bundle rupa/z z.sh
antigen bundle Vifon/deer
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle willghatch/zsh-cdr
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle git
antigen bundle zsh-users/zsh-completions
#antigen bundle zsh-users/zsh-autosuggestions
# no use
antigen bundle autojump
antigen bundle sorin-ionescu/prezto
# power line status
antigen theme romkatv/powerlevel10k
# display aliases command 
antigen bundle "MichaelAquilina/zsh-you-should-use"
antigen bundle supercrabtree/k
# antigen bundle zsh-users/zsh-history-substring-search
# enhance cd
antigen bundle b4b4r07/enhancd
antigen bundle denisidoro/navi
antigen bundle zsh-users/zaw
antigen bundle supercrabtree/k #list file info



# self bind key

bindkey '^P' history-search-backward
bindkey '^N' history-search-forward
bindkey '\eh' beginning-of-line
bindkey '\el' end-of-line

setopt auto_pushd
hash -d bmc=$HOME/wks/openbmc

# 不以空格开头的命令记录到历史中
setopt hist_ignore_space
alias cd=" cd"
alias ls=" ls"

antigen apply
