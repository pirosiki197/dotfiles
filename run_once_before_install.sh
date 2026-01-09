#!/bin/bash

set -euo pipefail

# install aqua
curl -sSfL https://raw.githubusercontent.com/aquaproj/aqua-installer/v4.0.2/aqua-installer | bash
# install mise
curl https://mise.run | sh
