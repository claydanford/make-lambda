all: clean install build install-ci package

clean:
	rm -rf node_modules dist out

install:
	npm install

build:
	npm run build

install-ci:
	rm -rf node_modules
	npm ci

package: package@createBook package@getBook

package@createBook:
	mkdir -p dist/createBook
	cp out/createBook.js* dist/createBook/
	zip -r ./dist/createBook.zip ./dist/createBook


package@getBook:
	mkdir -p dist/getBook
	cp out/getBook.js* dist/getBook/
	zip -r ./dist/getBook.zip ./dist/getBook
