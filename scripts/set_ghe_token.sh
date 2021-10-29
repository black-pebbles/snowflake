#!/bin/bash

# Read the user input.
echo "Enter github owner: "
read github_owner

echo "Enter github token: "
read github_token

export TF_VAR_github_owner=${github_owner}
export TF_VAR_github_token=${github_token}
