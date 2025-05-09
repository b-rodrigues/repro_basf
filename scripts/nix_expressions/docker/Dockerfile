FROM ubuntu:latest

RUN apt update -y

RUN apt install curl -y

# Get a default.nix with R and rix
RUN curl -O https://raw.githubusercontent.com/b-rodrigues/rix/master/inst/extdata/default.nix

RUN curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install linux \
  --extra-conf "sandbox = false" \
  --init none \
  --no-confirm

ENV PATH="${PATH}:/nix/var/nix/profiles/default/bin"

# Set up rstats-on-nix cache
RUN mkdir -p /root/.config/nix && \
    echo "substituters = https://cache.nixos.org https://rstats-on-nix.cachix.org" > /root/.config/nix/nix.conf && \
    echo "trusted-public-keys = cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY= rstats-on-nix.cachix.org-1:vdiiVgocg6WeJrODIqdprZRUrhi1JzhBnXv7aWI6+F0=" >> /root/.config/nix/nix.conf

# Copy a script to generate the environment of interest using rix
COPY generate_env.R .

# This will overwrite the default.nix we downloaded with a new one
RUN nix-shell --run "Rscript generate_env.R"

RUN nix-build

RUN nix-shell

CMD nix-shell