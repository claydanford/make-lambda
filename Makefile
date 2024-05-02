all: clean install build install-ci package deploy

clean: clean@service clean@cdk

clean@service:
	rm -rf service/node_modules service/out

clean@cdk:
	rm -rf cdk.out node_modules

install: install@service install@cdk

install@service:
	cd service && npm install

install@cdk:
	npm install

install-ci:
	cd service && \
	rm -rf node_modules && \
	npm ci --omit=dev

build:
	cd service && \
	npm run build && \
	cp package.json out

deploy:
	cdk deploy --require-approval never

destroy:
	cdk destroy -f

package: package@layer

package@layer:
	mkdir -p service/out/layer/nodejs
	cp -R service/node_modules service/out/layer/nodejs/
	cp -R service/out/lib service/out/layer/
	cp service/package.json service/out/layer/lib
