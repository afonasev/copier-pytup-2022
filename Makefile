.DEFAULT_GOAL := help

#
# COMMON ACTIONS
#

.PHONY: help
help:
	@echo "Usage: make <target>"
	@echo ""
	@echo "Targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-16s\033[0m %s\n", $$1, $$2}'

#
# CI ACTIONS
#

.PHONY: clean
clean:  ## Remove temporary test files
	@rm -rf ./tests/tmp

.PHONY: test
test:  ## Test template with test cases
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

.PHONY: create_test_case
create_test_case:  ## Create test case projects
	@copier --defaults \
		--vcs-ref=HEAD \
		-d project_name="Simple" \
		-d project_description='Simple project description' \
		-d author_fullname="John Doe" \
		-d author_username="doe" \
		-d author_email="doe@gmail.com" \
		copy . ./tests/cases/simple

#
# RELEASE ACTIONS
#

.PHONY: release
release:  ## Release new template version (version argument is needed)
	@git tag $(version)
	@git push --tags
