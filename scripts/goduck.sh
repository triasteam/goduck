set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

function print_blue() {
  printf "${BLUE}%s${NC}\n" "$1"
}

function print_green() {
  printf "${GREEN}%s${NC}\n" "$1"
}

function print_red() {
  printf "${RED}%s${NC}\n" "$1"
}

SYSTEM=$(uname -s)

if ! type goduck >/dev/null 2>&1; then
  print_blue "===> Install goduck"
  if [ "${SYSTEM}" == "Linux" ]; then
    wget https://github.com/meshplus/goduck/releases/download/v0.1.0/goduck_0.1.0_Linux_x86_64.tar.gz
    tar zxf goduck_0.1.0_Linux_x86_64.tar.gz
    rm -r goduck_0.1.0_Linux_x86_64.tar.gz
  elif [ "${SYSTEM}" == "Darwin" ]; then
    wget https://github.com/meshplus/goduck/releases/download/v0.1.0/goduck_0.1.0_Darwin_x86_64.tar.gz
    tar zxf goduck_0.1.0_Darwin_x86_64.tar.gz
    rm -r goduck_0.1.0_Darwin_x86_64.tar.gz
  else
    print_red "goduck does not support the current operating system"
    exit 0
  fi
  chmod +x goduck
  mv goduck /usr/local/bin/
fi