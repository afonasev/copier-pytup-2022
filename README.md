# copier-pytup-2022

Minimal [Copier] template for Pytup 2022.

## Getting Started

Install [Copier] and generate a new project:

```bash
>>> pipx install copier
>>> copier gh:afonasev/copier-pytup-2022 project
```

Copier prompts you for information about new project.
There you go - you just created a minimal project:

```no-highlight
project/
├── project
│   ├── __init__.py
├── tests
│   ├── conftest.py
│   └── test_project.py
├── .gitignore
├── copier.yml
├── LICENSE
├── Makefile
└── README.md
```

## Features

- Just very simple example of [Copier] template

## Actions

### Show help

```bash
>>> make help
Usage: make <target>

Targets:
clean            Remove temporary test files
create_test_case Create test cases projects
release          Release new template version (version argument is needed)
test             Test template with test cases
```

### Create test cases projects

```bash
>>> make create_test_case
```

### Run tests

```bash
>>> make test
```

### Release new template version (version argument is needed)

```bash
>>> make release version="1.1"
```

## Resources

Please consult the [Copier] docs for more information.

## Issues

If you encounter any problems, please [file an issue] along with a
detailed description.

## License

Distributed under the terms of the [MIT license], copier-pytup-2022 is free and open source software.

  [Copier]: https://copier.readthedocs.io/en/stable/
  [MIT license]: http://opensource.org/licenses/MIT
  [file an issue]: https://github.com/pytest-dev/cookiecutter-pytest-plugin/issues
