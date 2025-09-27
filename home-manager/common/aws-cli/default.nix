{ config, lib, pkgs, ... }:
let
  awsDir = "${config.home.homeDirectory}/.aws";
  awsConfigPath = "${awsDir}/config";
  awsCredentialsPath = "${awsDir}/credentials";
in
{
  age.secrets.aws-config.file = ./aws-config.age;
  age.secrets.aws-credentials.file = ./aws-credentials.age;

  home.packages = [ pkgs.awscli2 ];

  home.activation = {
    symlinkAwsSecrets = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      mkdir -p "${awsDir}"
      ln -sf ${config.age.secrets.aws-config.path} ${awsConfigPath}
      ln -sf ${config.age.secrets.aws-credentials.path} ${awsCredentialsPath}
    '';
  };
}
