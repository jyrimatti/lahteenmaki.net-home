#! /usr/bin/env nix-shell
#! nix-shell -i dash -I channel:nixos-24.05-small -p dash tarsnap
set -eu

now="$(date +%Y-%m-%dT%H:%M:%S)"

for i in automower homewizard huawei ouman ping speed stiebel; do
  tarsnap -c -f "databases-$i-$now" /var/www/stiebel/$i.db
done

tarsnap -c -f "databases-spot-$now" /var/spot/spot.db

tarsnap -c -f "logs-nginx-$now" /var/log/nginx
