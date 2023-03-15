#!/bin/sh

# 引数が指定されているか確認する
if [ $# -eq 0 ]; then
    echo "Usage: $0 directory_name"
    exit 1
fi

npm create vite $0 -- --template react-ts

cd $0

npm install && npm run build

wget https://avatars.githubusercontent.com/u/18340344?v=4 -O favicon.png

echo '''{
  "manifest_version": 3,
  "name": "my chrome home",
  "version": "0.1",
  "description": "Chrome Extension customized chrome home tabs",
  "icons": {
    "16": "./favicon.png"
  },
  "permissions": [
    "webRequest",
    "storage"
  ],
  "chrome_url_overrides": {
    "newtab": "dist/index.html"
  }
}''' >> manifest.json

echo "Need overwrite vite.config.js base option '/dist'"
