{
  lib,
  pkgs,
  ...
}:
{
  services.qbittorrent = {
    enable = true;
    extraArgs = [ "--confirm-legal-notice" ];
  };

  systemd.services.create-media-server-docker-network = {
    description = "Create media server Docker network";
    after = [
      "network.target"
      "docker.service"
    ];
    requires = [ "docker.service" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = "${pkgs.docker}/bin/docker network create media-server";
      SuccessExitStatus = 1; # in case the network already exists
    };
  };

  virtualisation.oci-containers = {
    backend = "docker";
    containers = {
      jellyfin = {
        image = "jellyfin/jellyfin";
        user = "1000:1000";
        ports = [ "8096:8096" ];
        environment = {
          NVIDIA_VISIBLE_DEVICES = "all";
          NVIDIA_DRIVER_CAPABILITIES = "all";
        };
        volumes = [
          "/mnt/AnotherDrive/DockerMediaServer/jellyfin/config:/config"
          "/mnt/AnotherDrive/DockerMediaServer/jellyfin/cache:/cache"
          "/mnt/AnotherDrive/Videos:/mnt/videos"
        ];
        extraOptions = [
          "--device=nvidia.com/gpu=all"
          "--network=media-server"
        ];
      };

      shoko-server = {
        image = "ghcr.io/shokoanime/server:latest";
        extraOptions = [
          "--shm-size=256m"
          "--network=media-server"
        ];
        ports = [ "8111:8111" ];
        environment = {
          PUID = "1000";
          PGID = "100";
          TZ = "Asia/Dhaka";
        };
        volumes = [
          "/mnt/AnotherDrive/DockerMediaServer/shoko-config:/home/shoko/.shoko"
          "/mnt/AnotherDrive/Videos:/mnt/videos"
        ];
      };
    };
  };
}
