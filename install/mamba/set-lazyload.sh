#!/bin/bash

# There is probably a better way to do this, but for now this works.
# This avoids defining miniforge3 paths and we can just use the env. variables
# set by the conda and mamba inits to populate .bashrc.

# Initialize mamba shell integration
eval "$(mamba shell hook --shell bash)"
sleep 1

# populate .bashrc with conda and mamba init lines
conda init bash
mamba shell init

# Utilize the environment variables set by the inits to overwrite .bashrc with
# the correct paths for lazy loading of conda/mamba. This speeds up shell
# startup time significantly, especially with many environments.

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
