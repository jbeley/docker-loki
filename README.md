# docker-loki
Docker container for loki IOC scanner

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
To run a Loki YARA scan against the contents of $YOUR_DATA_DIR:
```
docker run -v $YOUR_DATA_DIR:/data/ -u root -it jbeley/loki python loki.py -p /data/
```


## loki's license
see https://github.com/Neo23x0/Loki/blob/master/LICENSE

## Credits

* [http://jmkhael.io/makefiles-for-your-dockerfiles/](http://jmkhael.io/makefiles-for-your-dockerfiles/)
* [https://github.com/jessfraz/dockerfiles](https://github.com/jessfraz/dockerfiles)
* [https://github.com/orlikoski/CDQR](https://github.com/orlikoski/CDQR)
* [https://github.com/log2timeline/](https://github.com/log2timeline/)
