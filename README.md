# docker-plaso
Docker container for plaso supertimlining tool

## Usage
```
docker run --rm  -v YOUR_DATA_DIR:/data/ -u root -it jbeley/plaso:20190916 \
   log2timeline.py --status_view linear --parsers YOUR_PARSER_LIST /data/PLASOFILE.pb  /data/YOUR_INPUT



docker run -v YOUR_DATA_DIR:/data/ -u root -it jbeley/plaso:20190916 psort.py -o json_line -w YOUR_OUTPUT.json /data/PLASOFILE.pb
```


## Plaso's license
see https://github.com/log2timeline/plaso/wiki/Licenses-dependencies
