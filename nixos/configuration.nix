# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./packages.nix
      # ./vbox.nix

      <home-manager/nixos>
      ./home.nix
    ];

  # Use the GRUB 2 boot loader.
  # boot.loader.grub = {
  #   enable = true;
  #   version = 2;
  #   boot.loader.grub.efiSupport = true;
  #   boot.loader.grub.efiInstallAsRemovable = true;
  #   boot.loader.efi.efiSysMountPoint = "/boot/efi";
  #   # Define on which hard drive you want to install Grub.
  #   device = "nodev"; # "/dev/sda"; # or "nodev" for efi only
  # };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  # Fancy boot screen
  # boot.plymouth.enable = true;

  boot.tmpOnTmpfs = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Prague";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp0s20f0u3c2.useDHCP = true;
  networking.interfaces.enp0s31f6.useDHCP = true;
  networking.interfaces.wlp2s0.useDHCP = true;


  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };


  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.piti = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = with pkgs; [
  #   # direnv
  #   # nix-direnv

  #   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #   wget
  #   curl
  #   git
  #   openssh
  #   firefox
  #   coreutils
  #   tmux

  #   vscode

  #   # Virtualization
  #   virtualbox
  #   qemu
  #   docker

  #   # Modern UNIX
  #   # exa
  #   # bat
  #   # ripgrep
  #   # fzf
  #   # du-dust
  #   # difftastic

  #   # Plasma things
  #   libsForQt5.qtstyleplugin-kvantum

  #   # dwm
  #   # dmenu
  #   # st
  #   rxvt-unicode
  #   # dwl
  #   # river
  #   # qtile
  # ];

  # home-manager.users.piti = { pkgs, ... }: {
  #   import = [ /home/piti/.config/nixpkgs/home.nix ];
  # };

  # Set vim as default editor
  programs.vim = {
    defaultEditor = true;
    # extraConfig = ''
    #   set mouse=a
    #   set autoindent
    #   set tabstop=4
    #   set softtab=4
    # '';
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the Plasma 5 Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  
  # 
  # services.xserver.windowManager.dwl.enable = true;
  # services.xserver.windowManager.river.enable = true;
  # services.xserver.windowManager.dwm.enable = true;
  services.xserver.displayManager.lightdm.enable = true;

  # Configure keymap in X11
  services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  nix = {
    # settings.auto-optimise-store = true;
    package = pkgs.nixUnstable; # or versioned attributes like nix_2_4
    extraOptions = ''
      # add flakes support
      # experimental-features = nix-command flakes
      # nix options for derivations to persist garbage collection
      keep-outputs = true
      keep-derivations = true
    '';
  };

  # environment.pathsToLink = [
  #   "/share/nix-direnv"
  # ];
  # # if you also want support for flakes (this makes nix-direnv use the
  # # unstable version of nix):
  # nixpkgs.overlays = [
  #   (self: super: {
  #     nix-direnv = super.nix-direnv.override { enableFlakes = true; };
  #     # st = super.st.overrideAttrs (old: { src = /home/piti/suckless/st ;});
  #   } )
  # ];

  nixpkgs.config.allowUnfree = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}

