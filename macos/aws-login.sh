#!/bin/zsh
aws sso login
aws ecr get-login-password | docker login --username AWS --password-stdin 028492302030.dkr.ecr.ap-northeast-1.amazonaws.com
