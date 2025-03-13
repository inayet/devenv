{ pkgs, ... }:

{
  packages = [
    # from the rust-overlay
    pkgs.rust-bin.stable.latest.default

    # from subflake
    pkgs.hello2
  ];

  overlays = [
    (final: prev: {
      hello = prev.hello.overrideAttrs (old: {
        version = "2.0.0";
      });
    })
  ];

  enterTest = ''
    hello --version | grep "2.0.0"
  '';
}
