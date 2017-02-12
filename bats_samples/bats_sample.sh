#!/usr/bin/env bash

errtrap() {
  errcode=$?
  echo "error line $1: command exited with status $errcode."
}

initialize() {
  set -euo pipefail
  declare TMP_DIR=$(mktemp -d)
  trap "
    errtrap $LINENO
    rm -rf ${TMP_DIR}
    echo 'completed with errors.'
  " ERR
}

usage_exit() {
  echo "Usage: $0 [-a] [-d dir] item ..." 1>&2
  exit 1
}

initialize

while getopts ad:h OPT
do
  case $OPT in
    a)  FLAG_A=1
        ;;
    d)  VALUE_D=$OPTARG
        ;;
    h)  usage_exit
        ;;
    \?) usage_exit
        ;;
  esac
done
shift $((OPTIND - 1))


echo "hello world"

