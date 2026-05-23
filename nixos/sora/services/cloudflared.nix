{ config, ... }:
{
  age.secrets.cloudflared-creds.file = ./cloudflared-tunnel-creds.age;

  services.cloudflared = {
    enable = true;
    tunnels = {
      "465a823d-a9b9-4f40-9135-8693d577b71d" = {
        credentialsFile = "${config.age.secrets.cloudflared-creds.path}";
        default = "http_status:404";
      };
    };
  };
}
