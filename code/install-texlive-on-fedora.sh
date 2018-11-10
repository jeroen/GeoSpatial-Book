#!/bin/sh

sudo yum install -y $(cat ../latex/TeXLive-fedora.pkgs | tr '\n' ' ') || true
