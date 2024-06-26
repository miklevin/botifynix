{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.python3
    pkgs.python3Packages.jupyterlab
    pkgs.python3Packages.nbdev
    pkgs.python3Packages.virtualenv
    pkgs.git
  ];

  shellHook = ''
    # Navigate to the repository directory
    cd ./repos/AuditByBotify

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
