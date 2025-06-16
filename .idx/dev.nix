# To learn more about how to use Nix to configure your environment
# see: https://firebase.google.com/docs/studio/customize-workspace
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-24.05"; # or "unstable"
  services = {
    docker = { 
      enable = true;
    };
  };
  
  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.nodejs_22
    pkgs.docker-compose
    pkgs.python311
    pkgs.python311Packages.pip
  ];

  # Sets environment variables in the workspace
  env = {
    NODE_ENV = "development";
    
    DATABASE_CLIENT= "postgres";
    DATABASE_HOST= "0.0.0.0";
    DATABASE_PORT= "5432";
    DATABASE_NAME = "cms-strapi";
    DATABASE_USERNAME = "app";
    DATABASE_PASSWORD = "anypassword";
  };
  
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [];

    workspace = {
      # Runs when a workspace is first created with this `dev.nix` file
      onCreate = {
      };
      # To run something each time the workspace is (re)started, use the `onStart` hook
    };
    # Enable previews and customize configuration
    previews = {
    };
  };
}
