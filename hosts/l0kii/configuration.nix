# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 15d";
    };
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  nixpkgs.config.allowUnfree = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "l0kii"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.wireless.userControlled.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Santiago";

  # Select internationalisation properties.
  i18n.defaultLocale = "es_CL.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_CL.UTF-8";
    LC_IDENTIFICATION = "es_CL.UTF-8";
    LC_MEASUREMENT = "es_CL.UTF-8";
    LC_MONETARY = "es_CL.UTF-8";
    LC_NAME = "es_CL.UTF-8";
    LC_NUMERIC = "es_CL.UTF-8";
    LC_PAPER = "es_CL.UTF-8";
    LC_TELEPHONE = "es_CL.UTF-8";
    LC_TIME = "es_CL.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  services.xserver.videoDrivers = [ "radeon" "nvidia" ];
  hardware.opengl.enable = true;
  hardware.opengl.driSupport32Bit = true;

  # hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.prime.offload.enable = true;
  hardware.nvidia.prime.nvidiaBusId = "PCI:1:0:0";
  hardware.nvidia.prime.amdgpuBusId = "PCI:6:0:0";

  hardware.logitech.wireless.enable = true;
  hardware.logitech.wireless.enableGraphical = true;

  # specialisation = {
  #   external-display.configuration = {
  #     system.nixos.tags = [ "external-display" ];
  #     hardware.nvidia.prime.offload.enable = pkgs.lib.mkForce false;
  #     hardware.nvidia.powerManagement.enable = pkgs.lib.mkForce false;
  #   };
  # };

  # bluetooth
  # hardware.bluetooth.enable = true;
  # services.blueman.enable = true;

  # services.xserver.windowManager.bspwm.enable = true;
  # programs.hyprland.enable = true;
  # programs.xwayland.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;


  # Configure keymap in X11
  services.xserver = {
    layout = "latam,us";
    xkbVariant = ",altgr-intl";
  };

  # Configure console keymap
  console.keyMap = "es";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  programs = {
    fish = {
      enable = true;
    };
  };

  # Define a  account. Don't forget to set a password with ‘passwd’.
  users.users.saidgeek = {
    isNormalUser = true;
    description = "saidgeek";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.fish;
    packages = [
      pkgs.home-manager
    ];
  };


  fonts.fonts = with pkgs; [
    google-fonts
    noto-fonts
    noto-fonts-emoji
    noto-fonts-extra
    (
      nerdfonts.override {
        fonts = [
          "VictorMono"
          "Noto"
          "Hack"
          "Ubuntu"
        ];
      }
    )
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    git
    wget
    fish
    cmake
    gcc
    xclip
    vim
  ];

  virtualisation = {
    docker = {
      enable = true;
    };
  };

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
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
