# transmission-remove-completed-torrents
Transmission remote script removing completed torrents.

## Configuration
Change username and password (if exist) and your are good to go :)

## Crontab

``` shell
crontab -e
```

Clean up every minute

``` shell
* * * * * /home/pi/posttorrent.sh
```
