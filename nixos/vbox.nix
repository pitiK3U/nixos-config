{ config, pkgs, lib, ... }:

{
  # VirtualBox guest additions
  virtualisation.virtualbox.guest.enable = true;

  # Chaking virtual fs always fails
  boot.initrd.checkJournalingFS = false;

  # TODO: remove me after https://github.com/NixOS/nixpkgs/pull/86473 is applied
  services.xserver.videoDrivers = lib.mkForce [ "vmware" "virtualbox" "modesetting" ];
  systemd.services.virtualbox-resize = {
    description = "VirtualBox Guest Screen Resizing";

    wantedBy = [ "multi-user.target" ];
    requires = [ "dev-vboxguest.device" ];
    after = [ "dev-vboxguest.device" ];

    unitConfig.ConditionVirtualization = "oracle";

    serviceConfig.ExecStart = "@${config.boot.kernelPackages.virtualboxGuestAdditions}/bin/VBoxClient -fv --vmsvga";
  };
}
