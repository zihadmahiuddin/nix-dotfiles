{ pkgs, ... }:
{
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    lowLatency = {
      # enable this module
      enable = false;
      # defaults (no need to be set unless modified)
      quantum = 64;
      rate = 48000;
      alsa = {
        enable = true;
        format = "S16_LE";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    pulseaudio
  ];
}
