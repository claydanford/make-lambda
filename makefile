all: clean install build install-ci package

clean:
	rm -rf service/node_modules dist service/out

install:
	cd service && npm install

build:
	cd service && npm run build

install-ci:
	cd service && \
	rm -rf node_modules && \
	npm ci

package: package@layer package@createBook package@getBooks

package@layer:
	mkdir -p dist/nodejs
	cp -R service/node_modules dist/nodejs/
	cd dist && zip -r ./nodejs.zip ./nodejs

package@createBook:
	mkdir -p dist/createBook
	cp service/out/createBook.js* dist/createBook
	cd dist && zip -r ./createBook.zip ./createBook


package@getBooks:
	mkdir -p dist/getBooks
	cp service/out/getBooks.js* dist/getBooks
	cd dist && zip -r ./getBooks.zip ./getBooks
