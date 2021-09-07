#!/bin/bash
# Sets all of the required environment variables to default values.

# FIXME This does not work because of the subshell that is created. Using
# separate script for now.
# Generate a secret key using the Django generator.
generatekey()
{
    python manage.py shell -c 'from django.core.management import utils; print(utils.get_random_secret_key())'
}

# MUST be run by sourcing the script in the current shell in order for the
# environment variables to be set in the same shell process.
printf "NOTE: run this script like this: \n \t. ./boostrap_env.sh\n"

printf "Setting environment variables...\n"

# Change these values to fit your environment.
export RITLINKS_DB=""
export RITLINKS_DB_USER=""
export RITLINKS_DB_PW=""
export RITLINKS_DB_HOST=""
export RITLINKS_DB_PORT=""
export SECRET_KEY=$(./generate_secret_key.sh)

