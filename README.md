This directory contains scripts to perform different types of static code analysis:

* `reference` is a support script, gathers all changed files to be analyzed by the different scripts.
* `run_flake8` validate PEP8 standards, cyclomatic complexity and more.
* `run_mypy` check for and validate typing usage.
* `run_pycodestyle` same as flake8, does some checks not handled by flake8. Overlapping checks are disabled for pycodestyle.
* `run_pytest` executes the unit tests.
* `run_specific` drags in project specific checks into the CI/CD flow. Checks for and executes all scripts in `{PRJ_ROOT}/ci_specific`
* `run_vulture` tests for dead/unused code.

The `cfg` folder contains the configuration files for the different code analysis tools.
The `local` folder contains the scripts that enable execution of the scripts in a Docker on a developers device.

