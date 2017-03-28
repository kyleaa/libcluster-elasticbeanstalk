#!/bin/bash
export NODE_HOST=$(curl -s -S http://169.254.169.254/latest/meta-data/local-ipv4)
export NODE_PORT=8174
export REPLACE_OS_VARS=true
elixir -pa _build/prod/consolidated --cookie sample --name phoenix@$NODE_HOST --erl "-kernel inet_dist_listen_min $NODE_PORT" --erl "-kernel inet_dist_listen_max $NODE_PORT" -S mix phoenix.server
