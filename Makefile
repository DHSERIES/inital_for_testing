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


create_dirs:
	@mkdir -p data src 
	@touch src/main.py
	@echo "Directories and beginner main file created."


# Default target to create the virtual environment, install dependencies, create directories, and run tests, style checks, and Jupyter
all: install create_dirs 