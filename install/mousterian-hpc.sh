#!/bin/bash

# Run hpc installers
for installer in install/hpc/*.sh; do source $installer; done