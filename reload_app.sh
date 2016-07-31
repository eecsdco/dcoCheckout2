#!/usr/bin/env sh
old_pwd=`pwd`
cd /w/web/dco-checkout2
sudo bundle exec passenger-config restart-app /w/web/sabine
cd $old_pwd
