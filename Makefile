clean:
	@rm -rf ./tests/tmp

test: clean
	@copier . ./tests/tmp/simple --defaults\
		-d project_name="Simple" \
		-d project_description='Simple project description' \
		-d author_fullname="John Doe" \
		-d author_username="doe" \
		-d author_email="doe@gmail.com"

	@diff --side-by-side \
		--suppress-common-lines \
		--recursive \
		./tests/simple ./tests/tmp/simple

release:
	@git tag $(version)
	@git push --tags
