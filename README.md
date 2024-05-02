# make-lambda

An opinionated way to package lambda files.

# Features
- Example Makefile
- Individually package lambda functions
- Include lambda layer for node_modules and shared libs

# How it works
- Lambda files follow the lambda per function methodology of the lambda trilogy
- Each function has it's own file under service
- Each file is packaged individually to a zip file and uploaded by the IaC
- The root Makefile does the packaging
- This keeps lambda files very small and easily deployable
- The lambda files are deployed as a module

# Deploying
- Set CLI creds
- run `make`

# Author
- Clay Danford
