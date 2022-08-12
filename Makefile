clean:
	@rm -rf ./tests/tmp

test: clean
	@echo "----- Simple testcase -----"

	@copier --defaults \
		--vcs-ref=HEAD \
		-d project_name="Simple" \
		-d project_description='Simple project description' \
		-d author_fullname="John Doe" \
		-d author_username="doe" \
		-d author_email="doe@gmail.com" \
		copy . ./tests/tmp/simple

	@diff --recursive \
		--exclude=.copier-answers.yml \
		./tests/cases/simple ./tests/tmp/simple

	@echo "----- Tests passed! -----"

generate_cases:
	@copier --defaults \
		--vcs-ref=HEAD \
		-d project_name="Simple" \
		-d project_description='Simple project description' \
		-d author_fullname="John Doe" \
		-d author_username="doe" \
		-d author_email="doe@gmail.com" \
		copy . ./tests/cases/simple

release:
	@git tag $(version)
	@git push --tags
