let
  zihad = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILcVH8aHNDVPUADwzQWA5DYgLvpFUezy4eMWtOO8Oopi";
  users = [ zihad ];

  sora = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGgSFyx/pNp/wNuIDbPiGYSorlMjhYfNiONNskIlAy4+";
  systems = [ sora ];

  all = users ++ systems;
in
{
  "./home-manager/common/aws-cli/aws-credentials.age".publicKeys = [ zihad ];
  "./home-manager/common/aws-cli/aws-config.age".publicKeys = [ zihad ];
}
