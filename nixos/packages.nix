{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # direnv
    # nix-direnv

    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    curl
    git
    openssh
    firefox
    coreutils
    tmux

    vscode

    # Virtualization
    virtualbox
    qemu
    docker

    # Modern UNIX
    # exa
    # bat
    # ripgrep
    # fzf
    # du-dust
    # difftastic

    # Plasma things
    libsForQt5.qtstyleplugin-kvantum

    # dwm
    # dmenu
    # st
    rxvt-unicode
    # dwl
    # river
    # qtile
  ];
}
