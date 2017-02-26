# elfinder
run elfinder (https://github.com/Studio-42/elFinder) in container.

## set directory to share
to share a container mount a host directory as '/var/www/html/files'

```
-v /hostdir:/var/www/html/files
```

## overwrite config
to overwrite the configuration of elfinder mount a config file as '/var/www/html/php/connector.minimal.php'
```
-v /local/config.php:/var/www/html/php/connector.minimal.php:ro
```