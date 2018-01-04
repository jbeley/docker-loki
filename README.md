# docker-plaso
Docker container for plaso supertimlining tool



## Usage
```
 docker run --rm -ti -v /data:/data jbeley/plaso
 log2timeline.py --data /usr/share/plaso/ --artifact_definitions \
 /usr/share/artifacts/  --hashers md5 --vss_stores all --partitions all \
 /tmp/WinXP.pb /data/WinXP2.E01
```


## Plaso's license
see https://github.com/log2timeline/plaso/wiki/Licenses-dependencies

## Credits
http://jmkhael.io/makefiles-for-your-dockerfiles/
https://github.com/jessfraz/dockerfiles
