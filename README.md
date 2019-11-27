[![](https://images.microbadger.com/badges/image/jbeley/plaso.svg)](https://microbadger.com/images/jbeley/plaso "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/jbeley/plaso.svg)](https://microbadger.com/images/jbeley/plaso "Get your own version badge on microbadger.com")

# docker-plaso
Docker container for plaso supertimlining tool

## Building
The following `make` targets are availible

|target|description
|------|------|
|**build**|build the docker image|
|**cdqr**|run cdqr against WinXP2.E01|
|**git-push**|push this repo|
|**hub-build**|schedule bulid on docker hub|
|**log2timeline**|run log2timeline against WinXP2.E01|
|**pinfo**|run pinfo against WinXP2.plaso|
|**psort-analysis**|run psort with analysis plugins  against WinXP2.plaso|
|**psort-csv**|run pinfo against WinXP2.plaso|
|**psort**|run pinfo against WinXP2.plaso|
|**push**|push image to docker hub|
|**shell**|run a shell in the docker container as an unpriviledged user (usefulfor debugging)|
|**shell-root**|run a shell in the docker container as root (useful for debugging)|
|**test**|run all tests|

## Usage
```
<<<<<<< HEAD
docker run --rm  -v YOUR_DATA_DIR:/data/ -u root -it jbeley/plaso:20190916 \
   log2timeline.py --status_view linear --parsers YOUR_PARSER_LIST /data/PLASOFILE.pb  /data/YOUR_INPUT



docker run -v YOUR_DATA_DIR:/data/ -u root -it jbeley/plaso:20190916 psort.py -o json_line -w YOUR_OUTPUT.json /data/PLASOFILE.pb
=======
 docker run --rm -ti -v /data:/data jbeley/plaso
 log2timeline.py --data /usr/share/plaso/ --artifact_definitions \
 /usr/share/artifacts/  --hashers md5 --vss_stores all --partitions all \
 /tmp/WinXP.pb /data/WinXP2.E01
>>>>>>> ca21e97728be2bec25193a35202ec6b04799028f
```


## Plaso's license
see https://github.com/log2timeline/plaso/wiki/Licenses-dependencies

## Credits

* [http://jmkhael.io/makefiles-for-your-dockerfiles/](http://jmkhael.io/makefiles-for-your-dockerfiles/)
* [https://github.com/jessfraz/dockerfiles](https://github.com/jessfraz/dockerfiles)
* [https://github.com/orlikoski/CDQR](https://github.com/orlikoski/CDQR)
* [https://github.com/log2timeline/](https://github.com/log2timeline/)
