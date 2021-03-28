if command -v xclip > /dev/null 2>&1; then
    :
else
  echo "You need \"xclip\" tool for this script."
  echo "In ubuntu you can install it with \"sudo apt install xclip\" command."
  exit
fi

if command -v aws > /dev/null 2>&1; then
    :
else
  echo "You need \"aws cli\" tool for this script."
  exit
fi
