export EDITOR="nvim"
export JAVA_HOME='/usr/lib/jvm/java-23-openjdk'
export LESS='-R --use-color'
export BAT_PAGER="less -RF"
export TMUX_PLUGIN_MANAGER_PATH="$HOME/.tmux/plugins"
export PHP_INI_SCAN_DIR="$HOME/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

typeset -U path
path=(
  $path
  "$HOME/Applications"
  "$HOME/.cargo/bin"
  "$HOME/.local/bin"
  "$HOME/.config/herd-lite/bin"
  "$HOME/go/bin"
  "$HOME/.config/emacs/bin"
  "$HOME/.opencode/bin"
)
export PATH
