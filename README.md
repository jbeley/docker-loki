# docker-loki
Docker container for loki IOC scanner



## Usage
To run a Loki YARA scan against the contents of $YOUR_DATA_DIR:
```
docker run -v $YOUR_DATA_DIR:/data/ -u root -it jbeley/loki python loki.py -p /data/
```


## loki's license
see https://github.com/Neo23x0/Loki/blob/master/LICENSE

## Credits
http://jmkhael.io/makefiles-for-your-dockerfiles/
https://github.com/jessfraz/dockerfiles
