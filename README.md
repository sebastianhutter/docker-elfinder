# elfinder
run elfinder (https://github.com/Studio-42/elFinder) in container.

## set directory to share
to share a container mount a host directory as '/var/www/html/files'

```
-v /hostdir:/var/www/html/files
```

Alternatively you can set the environment variable `ELFINDER_FILES_PATH`  to point to
a different folder inside the container (defaults to `../files`)

## reverse proxy
to change the url with which files are delivered to the client you can set the env variable `ELFINDER_FILES_URI`.

For example:

elfinder container is accessible via reverse proxy url `http://reverse-proxy/elfinder`. Without the URL env variable set the application will redirect to the URI
`/files/myfile` when accessing the file `myfile`.

Setting the env variable `ELFINDER_FILES_URI` to `/elfinder/files` will make sure the file path stays in line with the reverse proxy config.

## overwrite config
to overwrite the configuration of elfinder mount a config file as '/var/www/html/php/connector.minimal.php'
```
-v /local/config.php:/var/www/html/php/connector.minimal.php:ro
```
