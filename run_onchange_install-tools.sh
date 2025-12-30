#!/bin/bash

# {{ include "private_dot_config/aquaproj-aqua/aqua.yaml" | sha256sum }}

set -e

export PATH=$PATH:$HOME/.local/share/aquaproj-aqua/bin
aqua install -a -l
