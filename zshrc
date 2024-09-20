
# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE="/usr/local/bin/micromamba";
export MAMBA_ROOT_PREFIX="/Users/jlubin/micromamba";
__mamba_setup="$('/usr/local/bin/micromamba' shell hook --shell zsh --prefix '/Users/jlubin/micromamba' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    if [ -f "/Users/jlubin/micromamba/etc/profile.d/micromamba.sh" ]; then
        . "/Users/jlubin/micromamba/etc/profile.d/micromamba.sh"
    else
        export  PATH="/Users/jlubin/micromamba/bin:$PATH"  # extra space after export prevents interference from conda init
    fi
fi
unset __mamba_setup
# <<< mamba initialize <<<
