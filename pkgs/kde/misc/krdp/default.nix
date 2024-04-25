{
  lib,
  mkKdeDerivation,
  fetchFromGitHub,
  pkg-config,
  extra-cmake-modules,
  kconfig,
  kdbusaddons,
  kpipewire,
  qtwayland,
  wayland,
  wayland-protocols,
  freerdp,
}:
mkKdeDerivation rec {
  pname = "krdp";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "KDE";
    repo = "krdp";
    rev = "7f9034973fc7c150f7b8249c0a9e22cc356ae65e";
    hash = "sha256-unasJdB4k0Lj/7sZpqgeQBxZ/cssd2t01HP3UjUlY1A=";
  };

  extraBuildInputs = [
    pkg-config
    extra-cmake-modules
    kconfig
    kdbusaddons
    kpipewire
    qtwayland
    wayland.dev
    wayland-protocols
    freerdp
  ];

  patches = [ ./cmake-kconfig.diff ];

  meta.license = with lib.licenses; [
    cc0
    gpl2Plus
    lgpl2Plus
    lgpl21Plus
  ];
}
