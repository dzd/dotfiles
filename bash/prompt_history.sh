# source: https://www.jefftk.com/p/you-should-be-logging-shell-history

function histgrep {
  local n_lines=10
  if [[ "$1" =~ ^[0-9]*$ ]]; then
    n_lines="$1"
    shift
  fi
  grep "$@" ~/.full_history | tail -n "$n_lines"
}

function promptFunc() {
    # right before prompting for the next command, save the previous
    # command in a file.
    echo "$(date +%Y-%m-%d--%H-%M-%S) $(hostname) $PWD $(history 1)" >> ~/.full_history
}

PROMPT_COMMAND=promptFunc
