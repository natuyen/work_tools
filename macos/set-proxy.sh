#!/bin/zsh -x
PROXY=http://dc-ty3-squid-1.cb.local:3128
export http_proxy=${PROXY}
export https_proxy=${PROXY}
