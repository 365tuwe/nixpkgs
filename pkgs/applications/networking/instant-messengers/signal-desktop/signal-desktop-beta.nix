{ callPackage }:
callPackage ./generic.nix { } rec {
  pname = "signal-desktop-beta";
  dir = "Signal Beta";
  version = "7.32.0-beta.1";
  url = "https://updates.signal.org/desktop/apt/pool/s/signal-desktop-beta/signal-desktop-beta_${version}_amd64.deb";
  hash = "sha256-WrHF7Y8OcEOr+W/Jhc+Hj5jCtOjKigZ02N9N/hE+XLA=";
}
