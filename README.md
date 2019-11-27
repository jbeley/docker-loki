# docker-plaso
Docker container for plaso supertimlining tool

## Building
The following `make` targets are availible

|target|description
|------|------|
|**build**|build the docker image|
|**git-push**|push this repo|
|**hub-build**|schedule bulid on docker hub|
|**shell**|run a shell in the docker container as an unpriviledged user (usefulfor debugging)|
|**shell-root**|run a shell in the docker container as root (useful for debugging)|
|**test**|run all tests|

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

* [http://jmkhael.io/makefiles-for-your-dockerfiles/](http://jmkhael.io/makefiles-for-your-dockerfiles/)
* [https://github.com/jessfraz/dockerfiles](https://github.com/jessfraz/dockerfiles)
* [https://github.com/orlikoski/CDQR](https://github.com/orlikoski/CDQR)
* [https://github.com/log2timeline/](https://github.com/log2timeline/)
