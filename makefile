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

package: package@createBook package@getBooks

package@createBook:
	mkdir -p dist/createBook
	cp out/createBook.js* dist/createBook/
	zip -r ./dist/createBook.zip ./dist/createBook


package@getBooks:
	mkdir -p dist/getBooks
	cp out/getBooks.js* dist/getBooks/
	zip -r ./dist/getBooks.zip ./dist/getBooks
