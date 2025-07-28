#!/bin/bash

# Copyright (c) Meta Platforms, Inc. and affiliates.
# All rights reserved.

# This source code is licensed under the license found in the
# LICENSE file in the root directory of this source tree.

# Define the URLs for the checkpoints
BASE_URL="https://github.com/IDEA-Research/GroundingDINO/releases/download/"
swint_ogc_url="${BASE_URL}v0.1.0-alpha/groundingdino_swint_ogc.pth"
swinb_cogcoor_url="${BASE_URL}v0.1.0-alpha2/groundingdino_swinb_cogcoor.pth"

# Use either wget or curl to download the checkpoints
if command -v wget &> /dev/null; then
    DL_CMD="wget"
    DL_ARGS=""
elif command -v curl &> /dev/null; then
    DL_CMD="curl"
    DL_ARGS="-L -O -k"
else
    echo "Please install wget or curl to download the checkpoints."
    exit 1
fi

echo "Downloading groundingdino_swint_ogc.pth checkpoint..."
$DL_CMD $DL_ARGS $swint_ogc_url || { echo "Failed to download checkpoint from $swint_ogc_url"; exit 1; }

echo "Downloading groundingdino_swinb_cogcoor.pth checkpoint..."
$DL_CMD $DL_ARGS $swinb_cogcoor_url || { echo "Failed to download checkpoint from $swinb_cogcoor_url"; exit 1; }

echo "All checkpoints are downloaded successfully."