{ pkgs ? import <nixpkgs> {} }:

let
  repoDir = "repos/AuditByBotify";
  gitClone = pkgs.runCommand "clone-repo" {
    buildInputs = [ pkgs.git ];
    } ''
      if [ ! -d ${repoDir} ]; then
        git clone git@github.com:miklevin/AuditByBotify.git ${repoDir}
      else
        echo "Repository already cloned."
      fi
      mkdir -p $out
      cp -r repos $out/
    '';
in
pkgs.mkShell {
  buildInputs = [
    pkgs.python3
    pkgs.python3Packages.jupyterlab
    pkgs.python3Packages.nbdev
    pkgs.python3Packages.virtualenv
    gitClone
  ];

  shellHook = ''
    cd ${gitClone}/repos/AuditByBotify

    # Create and activate virtual environment
    if [ ! -d .venv ]; then
      virtualenv .venv
    fi
    source .venv/bin/activate

    # Install necessary Python packages
    pip install jupyterlab nbdev

    echo "JupyterLab environment is set up."

    # Start JupyterLab
    jupyter lab
  '';
}
