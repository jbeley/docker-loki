include make_env

NS ?= jbeley
VERSION ?= latest

IMAGE_NAME ?= plaso
CONTAINER_NAME ?= plaso
CONTAINER_INSTANCE ?= default
VOLUMES=-v ~/Downloads/:/data -v /tmp:/output
.PHONY: build build-arm push push-arm shell shell-arm run run-arm start start-arm stop stop-arm rm rm-arm release release-arm

build: Dockerfile
	docker build -t $(NS)/$(IMAGE_NAME):$(VERSION) -f Dockerfile .

build-arm: Dockerfile.arm
	docker build -t $(NS)/rpi-$(IMAGE_NAME):$(VERSION) -f Dockerfile.arm .

hub-build: Dockerfile
	curl -H "Content-Type: application/json" --data '{"build": true}' -X POST ${hub_url}

git-push:
	git commit && \
		git push

push:
	docker push $(NS)/$(IMAGE_NAME):$(VERSION)

push-arm:
	docker push $(NS)/rpi-$(IMAGE_NAME):$(VERSION)

shell:
	docker run --rm --name $(CONTAINER_NAME)-$(CONTAINER_INSTANCE) -i -t $(PORTS) $(VOLUMES) $(ENV) $(NS)/$(IMAGE_NAME):$(VERSION) /bin/bash

shell-arm:
	docker run --rm --name rpi-$(CONTAINER_NAME)-$(CONTAINER_INSTANCE) -i -t $(PORTS) $(VOLUMES) $(ENV) $(NS)/rpi-$(IMAGE_NAME):$(VERSION) /bin/bash

shell-root:
	docker run -u root --rm --name $(CONTAINER_NAME)-$(CONTAINER_INSTANCE) -i -t $(PORTS) $(VOLUMES) $(ENV) $(NS)/$(IMAGE_NAME):$(VERSION) /bin/bash

run:
	docker run --rm --name $(CONTAINER_NAME)-$(CONTAINER_INSTANCE) $(PORTS) $(VOLUMES) $(ENV) $(NS)/$(IMAGE_NAME):$(VERSION)

run-arm:
	docker run --rm --name rpi-$(CONTAINER_NAME)-$(CONTAINER_INSTANCE) $(PORTS) $(VOLUMES) $(ENV) $(NS)/rpi-$(IMAGE_NAME):$(VERSION)

start:
	docker run -d --name $(CONTAINER_NAME)-$(CONTAINER_INSTANCE) $(PORTS) $(VOLUMES) $(ENV) $(NS)/$(IMAGE_NAME):$(VERSION)

start-arm:
	docker run -d --name rpi-$(CONTAINER_NAME)-$(CONTAINER_INSTANCE) $(PORTS) $(VOLUMES) $(ENV) $(NS)/rpi-$(IMAGE_NAME):$(VERSION)

stop:
	docker stop $(CONTAINER_NAME)-$(CONTAINER_INSTANCE)

stop-arm:
	docker stop rpi-$(CONTAINER_NAME)-$(CONTAINER_INSTANCE)

rm:
	docker rm $(CONTAINER_NAME)-$(CONTAINER_INSTANCE)

rm-arm:
	docker rm rpi-$(CONTAINER_NAME)-$(CONTAINER_INSTANCE)

release: build
	make push -e VERSION=$(VERSION)

release-arm: build-arm
	make push-arm -e VERSION=$(VERSION)

test: log2timeline psort psort-csv pinfo cdqr

log2timeline:
	docker run --rm -v ~/Downloads:/data -v /tmp:/output jbeley/plaso  log2timeline.py \
		--artifact_definitions /usr/share/artifacts --data /usr/share/plaso --parsers all \
		--partitions all --vss_stores all --hashers md5 \
		--logfile /output/log2timeline/WinXP2.plaso.log --status_view none -q  \
		/output/log2timeline/WinXP2.pb /data/WinXP2.E01
psort:
	docker run --rm -v /tmp:/output jbeley/plaso  psort.py -o json_line \
		-w /output/log2timeline/WinXP2.json  /output/log2timeline/WinXP2.pb \
		--logfile /output/log2timeline/WinXP2.psort.log --status_view none \
		-q
psort-csv:
	docker run --rm -v /tmp:/output jbeley/plaso  psort.py -o l2tcsv \
		-w /output/log2timeline/WinXP2.csv  /output/log2timeline/WinXP2.pb \
		--logfile /output/log2timeline/WinXP2.psort-csv.log --status_view none \
		-q
pinfo:
	docker run --rm -v /tmp:/output jbeley/plaso  pinfo.py --output_format json \
		-w /output/log2timeline/WinXP2-pinfo.json  /output/log2timeline/WinXP2.pb

cdqr:
	docker run --rm -it -v ~/Downloads:/data -v  /tmp:/output jbeley/plaso  \
		cdqr.py  --max_cpu -p datt --export /data/WinXP2.E01 /output/cdqr/


default: build
