if [[ "$1" == "ubuntu" ]]; then
    sudo apt install -y fd-find jq jsonnet ncdu ripgrep
elif [[ "$1" == "rhel" ]]; then
    # Set metadata for packages expires after 2 days so that we don't update the DNF repository cache everytime (which is slow) we install a package.
    METADATA_EXPIRATION=$(( 60 * 60 * 24 * 7 ))
    sudo dnf install -y --setopt metadata_expire=${METADATA_EXPIRATION} zsh zsh-syntax-highlighting tree ripgrep jq jsonnet ncdu neovim
    #fd-find hyperfine strace
fi

# sudo pip install neovim
