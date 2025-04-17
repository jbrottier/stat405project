#!/bin/bash

export KAGGLE_USERNAME="username"
export KAGGLE_KEY="key"

TARGET_DIR="/staging/groups/stat_dscp/my_group03"

cd "$TARGET_DIR" || exit 1

echo "Downloading NYC Taxi dataset into $TARGET_DIR..."
if kaggle datasets download microize/nyc-taxi-dataset -p "$TARGET_DIR" --unzip; then
    echo "Download completed successfully!"
else
    echo "Download failed." >&2
    exit 1
fi
