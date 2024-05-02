all: clean install build install-ci package deploy

clean: clean@service clean@cdk

clean@service:
	rm -rf service/node_modules dist service/out

clean@cdk:
	rm -rf cdk/cdk.out cdk/node_modules

install: install@service install@cdk

install@service:
	cd service && npm install

install@cdk:
	cd cdk && npm install

install-ci:
	cd service && \
	rm -rf node_modules && \
	npm ci --omit=dev

build:
	cd service && \
	npm run build && \
	cp package.json out

deploy:
	cd cdk && cdk deploy --require-approval never

destroy:
	cd cdk && cdk destroy -f

package: package@layer

package@layer:
	mkdir -p dist/layer/nodejs
	cp -R service/node_modules dist/layer/nodejs/
	cp -R service/out/lib dist/layer
	cp service/package.json dist/layer/lib
