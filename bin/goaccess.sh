#! /usr/bin/env nix-shell
#! nix-shell --pure -i dash -I channel:nixos-24.05-small -p dash goaccess
goaccess --log-format '%h - - %^[%d:%t] "%r" %s %b "%R" "%u"' --date-format '%d/%b/%Y' --time-format '%H:%M:%S %z' -o /var/www/report/index.html --restore --persist --db-path ~/.cache/goaccess $(ls /var/log/nginx/access.log* | grep -v .gz)
