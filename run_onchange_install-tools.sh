#!/bin/bash

# {{ include "private_dot_config/aquaproj-aqua/aqua.yaml" | sha256sum }}

set -e

aqua install -a -l
