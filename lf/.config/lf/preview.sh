#!/bin/sh

case $1 in
  *.md) glow $1 ;;
  *) bat $1 ;;
esac
