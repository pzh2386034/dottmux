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
# antigen bundle "MichaelAquilina/zsh-you-should-use"
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
bindkey '^h' backward-delete-char
bindkey '^j' backward-kill-word
bindkey '\eh' backward-char
bindkey '\el' forward-char
bindkey '\ej' backward-word
bindkey '\ek' forward-word



setopt auto_pushd
hash -d bmc=$HOME/wks/openbmc

# 不以空格开头的命令记录到历史中
setopt hist_ignore_space
alias cd=" cd"
alias ls=" ls"

antigen apply

alias qemu='f() {qemu-bmc -m 256 -M ast2600-evb -nographic -drive file=$1,format=raw,if=mtd -net nic -net user,hostfwd=:127.0.0.1:2222-:22,hostfwd=:127.0.0.1:2443-:443,hostname=qemu };f'
alias qemu-arm='f() {docker run -it --rm -v /home/pan/wks/raspberry/learn-raspberry/src/lesson00/:/root mikoto2000/qemu-system-arm}; f'
alias tex='f() {docker run -it --rm -v /home/pan/wks/greatwall/doc:/root zeuspan/texcompiler}; f'
alias dk-dhcpd='f() {docker run -it --rm --init --net host -v "/etc/dhcp":/data networkboot/dhcpd enx081f7135c299 &}; f'
alias dk-rpic='f() {docker run --rm -v $(pwd):/app -w /app pan/rpi-compiler make $1 };f'
alias um='f() {umount /media/pan/$1}; f'
export PATH="~/wk/qemu/build/aarch64-softmmu:${PATH}"
alias bmcweb='f() {docker run -it --rm -v /usr/share/www:/usr/share/www -v /home/pan/wks/testWeb/bmcweb:/build --net=host bmcweb-compiler}; f'

proxy () {
	export https_proxy='http://127.0.0.1:8889/'
	export http_proxy='http://127.0.0.1:8889/'
	echo "HTTP(s) proxy on"
}
noproxy () {
	unset http_proxy
	unset htps_proxy
	echo "HTTP(s) proxy off"
}
# export GIT_PROXY_COMMAND="oe-git-proxy"
# export NO_PROXY=$no_proxy
