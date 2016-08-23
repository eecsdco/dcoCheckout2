#!/usr/bin/env bash
if [ $(hostname -s) == checkout ]; then
old_pwd=`pwd`
cd /w/web/checkout
sudo bundle exec passenger-config restart-app /w/web/checkout
cd $old_pwd
else
echo "SSHing to checkout to restart..."
ssh travigd@checkout.eecs.umich.edu /w/web/checkout/reload_app.sh
fi
