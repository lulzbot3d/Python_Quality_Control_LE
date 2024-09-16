#!/bin/sh
set -eu

PARENT_BRANCH=${PARENT_BRANCH:-main}
CHANGED_BRANCH_FILES=$(git diff --name-only --diff-filter=d origin/"${PARENT_BRANCH}"...HEAD :^tests | grep -i .py$ | cat )

if [ -z "${ONLY_CHECK_STAGED:=""}" ] ; then
    echo "Local + staged + branch changes"
    CHANGED_LOCAL_FILES=$(git diff --name-only --diff-filter=d HEAD :^tests | grep -i .py$ | cat)
else
    echo "Staged + branch changes"
    CHANGED_LOCAL_FILES=$(git diff --name-only --diff-filter=d --staged :^tests | grep -i .py$ | cat)
fi

CHANGED_FILES=$(echo "${CHANGED_BRANCH_FILES}" "${CHANGED_LOCAL_FILES}" | tr ' ' '\n' | sort | uniq)

# Remove excluded files from changed files
if [ -f "excluded_files.txt" ]; then
    EXCLUDED_FILES=$(cat "excluded_files.txt")
    CHANGED_FILES=$(echo "${CHANGED_FILES}" | grep -vF "${EXCLUDED_FILES}")
fi

export PARENT_BRANCH
export CHANGED_FILES