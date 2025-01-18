# Check if `explorer.exe` is available (typically indicates WSL environment)
if command -v explorer.exe &> /dev/null; then
  # Define the open function
  function open() {
    if [ $# != 1 ]; then
      explorer.exe .
      return 0 # Force success exit code
    else
      if [ -e "$1" ]; then
        explorer.exe "$(wslpath -w "$1")" 2> /dev/null
        return 0 # Force success exit code
      else
        echo "open: $1 : No such file or directory"
        return 1
      fi
    fi
  }
else
  echo "open function is not defined because explorer.exe is unavailable."
fi
