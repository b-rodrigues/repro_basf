This folder contains a script called `generate_env.R` that uses `{rix}` to
generate a Nix expression to define a reproducible development environment.

If you have Nix installed on your system, you can build the environment by first
configuring the `rstats-on-nix` cache to accelerate package installation:

``` bash
nix-env -iA cachix -f https://cachix.org/api/v1/install
```

then use the cache:

``` bash
cachix use rstats-on-nix
```

You only need to do this once per machine where you intend to use `{rix}`. Many
thanks to [Cachix](https://www.cachix.org/) for sponsoring the `rstats-on-nix`
cache!

You can now build the environment like so:

``` bash
nix-build
```

and drop into the shell using:

``` bash
nix-shell
```

You can start Positron by typing `positron` in this shell.

You can also build a Docker image that includes this environment:

- Build the image with: `docker build -t nix_example .`

- Run a container with: `docker run -ti nix_example`
