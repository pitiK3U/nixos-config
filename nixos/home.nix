{ config, pkgs, ... }:

{
  home-manager.users.piti = { pkgs, ... }: {
    # Home Manager needs a bit of information about you and the
    # paths it should manage.
    home.username = "piti";
    home.homeDirectory = "/home/piti";
  
    home.packages = with pkgs; [
      # vscode
      neovim
      less
      bat
      exa
  
      graphviz
      # dot
  
  # gimp
  # krita
  # libreoffice
  # okular
    ];
  
    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    home.stateVersion = "22.05";
  
    # Let Home Manager install and manage itself.
    programs = {
      home-manager.enable = true;
      # bash.enableCompletion = true;
      # less.enable = true;
      # vim.defaultEditor = true;
      # man.enable = true;
    };
  };

  # Install packages to /etc/profiles.
  # Recommended to set by the home-manager guide (section 1.2).
  home-manager.useUserPackages = true;
  # Use the global system-level nixpkgs
  home-manager.useGlobalPkgs = true;
}
