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

This repository also implements Reusable Workflows and Actions for Github Actions.

Reusable Workflows:

- **Flake8**, **MyPy**, **PyCodeStyle**, **PyLint**: They all call the respective scripts inside a docker container and requires as `input` field the `Parent_Branch` to compare the filed against.
- **PyTest**: Fetch the companion repositories and then run the `run_pytest.sh` inside a docker container. It takes as optional `input` a `default-branch` to checkout the companion repositories in case there is no branch with the same name as the
caller branch. If not provided, it defaults to the repository default branch.
- **Vulture**: Run the `run_vulture.sh` inside a docker container. It takes no `input`.

Actions:
- **clone_repo**: Clone a specific repository and try to check out the current working branch, otherwise checkout the default one (default can be specified using an input field. If not specified, it uses the repo default one).

- **fetch_companion_repos**: Clone all “known” companion repos (currently: dbus-interface-lib, marvin-service, libPalantir, libSmeagol, libCharon, libLogger, ultiLib). This action basically calls clone_repo for all those repositories.
