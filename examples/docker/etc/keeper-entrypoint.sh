#!/bin/bash

# The command-line options specified in this script are expected NOT to change.
# To override the Keeper's entrypoint, you will have to provide the appropriate values for all the options. In particular, the user assigned to `--pg-su-username` must exist in the container, and `--pg-listen-address` must be unique, discoverable and accessible by other containers and replicas of Keeper.

sed -i.save s/100/${MAX_CONNECTIONS}/g ${STKEEPER_DATA_DIR}/postgres/postgresql.conf

stolon-keeper \
  --pg-su-username=postgres \
  --pg-repl-username=repluser \
  --pg-listen-address=$HOSTNAME
