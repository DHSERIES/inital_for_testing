VENV_DIR=.venv
REQUIREMENTS=requirements.txt

# Python interpreter
PYTHON=python3

# Create the virtual environment
$(VENV_DIR):
	$(PYTHON) -m venv $(VENV_DIR)

# Install dependencies from requirements.txt
install: $(VENV_DIR)
	$(VENV_DIR)/bin/pip install --upgrade pip
	$(VENV_DIR)/bin/pip install -r $(REQUIREMENTS)
	$(VENV_DIR)/bin/pip install jupyter
	$(VENV_DIR)/bin/python -m ipykernel install --user --name=.venv --display-name "Python (venv)"


create_dirs:
	@mkdir -p data src notebook
	@touch notebook/notebook.ipynb
	@echo "Directories and beginner notebook file created."


# Default target to create the virtual environment, install dependencies, create directories, and run tests, style checks, and Jupyter
all: install create_dirs 