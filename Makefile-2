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
	npm ci

build:
	cd service && npm run build

deploy:
	cd cdk && cdk deploy --require-approval never

destroy:
	cd cdk && cdk destroy -f

package: package@layer package@createBook package@getBooks

package@layer:
	mkdir -p dist/nodejs
	cp -R service/node_modules dist/nodejs/
	cp -R service/out/lib dist/
	cp service/package.json dist/lib
	cd dist && zip -r ./nodejs.zip ./nodejs ./lib 

package@createBook:
	mkdir -p dist/createBook
	cp service/out/createBook.js* dist/createBook
	cp service/package.json dist
	cd dist && zip -r ./createBook.zip ./createBook package.json


package@getBooks:
	mkdir -p dist/getBooks
	cp service/out/getBooks.js* dist/getBooks
	cp service/package.json dist
	cd dist && zip -r ./getBooks.zip ./getBooks package.json
