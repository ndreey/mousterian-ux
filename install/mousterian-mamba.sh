#!/bin/bash

# Install mamba first
source install/mamba/miniforge3.sh

sleep 1
source $HOME/.bashrc
sleep 1

eval "$(mamba shell hook --shell bash)"
sleep 1

source install/mamba/set-config.sh

# Overwrite .bashrc with correct paths for lazy loading of conda/mamba.
# This speeds up shell startup time.
cat > $HOME/.bashrc << EOF
#!/bin/bash

[ -f ~/.shell.d/rc ] && . ~/.shell.d/rc

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

for installer in install/mamba/env-*.sh; do source $installer; done
