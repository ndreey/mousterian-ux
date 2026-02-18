#!/bin/bash

# Run mamba installers
for installer in install/mamba/*.sh; do source $installer; done