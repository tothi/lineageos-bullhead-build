#!/bin/bash

# for running in crontab
export USER=`whoami`

# (re)building

make clobber
repo sync
source build/envsetup.sh
breakfast bullhead
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
ccache -M 50G
export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G"
croot
brunch bullhead
cd $OUT

# releasing

repo_full_name="tothi/lineageos-bullhead-build"
version="lineage-$(get_build_var LINEAGE_VERSION)"
date=`echo $version | cut -d- -f3`
text="Unofficial automated build. Use at your own risk!"
branch="master"

username="tothi-lineageos"
token="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

generate_post_data()
{
  cat <<EOF
{
  "tag_name": "$date",
  "target_commitish": "$branch",
  "name": "$version",
  "body": "$text",
  "draft": false,
  "prerelease": false
}
EOF
}

echo "Create release $version for repo: $repo_full_name branch: $branch"
id=$(curl -s -u $username:$token -X POST --data "$(generate_post_data)" "https://api.github.com/repos/$repo_full_name/releases" | jq '.id')

echo "Uploading assets..."
curl -s -u $username:$token -X POST -H "Content-Type: application/zip" --data-binary "@${version}.zip" "https://uploads.github.com/repos/$repo_full_name/releases/$id/assets?name=${version}.zip" | jq '.browser_download_url'
curl -s -u $username:$token -X POST -H "Content-Type: application/octet-stream" --data-binary "@recovery.img" "https://uploads.github.com/repos/$repo_full_name/releases/$id/assets?name=recovery.img" | jq '.browser_download_url'
