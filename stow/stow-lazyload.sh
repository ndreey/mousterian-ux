#!/bin/bash

# Strip trailing slash from input
MAMBA_EXE="${1%/}"

# Derive root prefix from exe path (.../miniforge3/bin/mamba -> .../miniforge3)
MAMBA_ROOT_PREFIX="$(dirname "$(dirname "$MAMBA_EXE")")"

cat >> "$HOME/.bashrc" << EOF

# >>> mamba lazy load >>>
export MAMBA_EXE='${MAMBA_EXE}'
export MAMBA_ROOT_PREFIX='${MAMBA_ROOT_PREFIX}'
export PATH="\$MAMBA_ROOT_PREFIX/bin:\$PATH"

function mamba() {
    unset -f mamba
    __mamba_setup="\$("\$MAMBA_EXE" shell hook --shell bash --root-prefix "\$MAMBA_ROOT_PREFIX" 2> /dev/null)"
    if [ \$? -eq 0 ]; then
        eval "\$__mamba_setup"
    else
        alias mamba="\$MAMBA_EXE"
    fi
    unset __mamba_setup
    mamba "\$@"
}
# <<< mamba lazy load <
EOF

echo "Mamba lazy load configured in ~/.bashrc"
echo "  MAMBA_EXE=$MAMBA_EXE"
echo "  MAMBA_ROOT_PREFIX=$MAMBA_ROOT_PREFIX"
