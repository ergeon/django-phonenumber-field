.PHONY: clean deploy distclean

# Project settings
PROJECT = phonenumber-field

# Virtual environment settings
ENV ?= venv
VENV = $(shell python -c "import sys; print(int(hasattr(sys, 'real_prefix')));")

# List directories
dist_dir = ./dist


clean:
	find $(clean_dirs) \( -name "*.pyc" -o -name __pycache__ -o -type d -empty \) -exec rm -rf {} + 2> /dev/null

deploy: distclean
	pip install build twine
	sudo apt install python3.6-venv -y
	python -m build
	twine upload -r pypi-ergeon dist/*

distclean: clean
	rm -rf $(ENV)/ ./build/ $(dist_dir)/ ./*egg* ./.coverage