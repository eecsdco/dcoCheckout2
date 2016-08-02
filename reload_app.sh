#!/usr/bin/env bash
if [ $(hostname -s) == sabine ]; then
old_pwd=`pwd`
cd /w/web/dco-checkout2
sudo bundle exec passenger-config restart-app /w/web/sabine
cd $old_pwd
else
echo "SSHing to Sabine to restart..."
ssh travigd@sabine.eecs.umich.edu /w/web/dco-checkout2/reload_app.sh
fi
