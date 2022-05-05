install:
	bundle config github.com ${GITHUB_TOKEN}
	bundle install
	git submodule update --init --remote --merge
	npm install

fetch-articles:
	git submodule update --init --remote --merge

run: package-js
	bundle exec jekyll serve

build:
	bundle exec jekyll build

clean:
	rm -rf .jekyll-cache/
	rm -rf _site/
	rm -rf node_modules

lint:
	bundle exec rubocop
	
lintfix:
	bundle exec rubocop -a

run-legacy-mysql:
	docker-compose -f stack.yml up

package-js:
	npm run webpack