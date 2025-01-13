# dotfiles

My dotfiles.

## Features

- Shell plugin management w/ [sheldon](https://sheldon.cli.rs/)
- Dress up w/ Powerlevel10k
- one-step installer, [`install.sh`](./install.sh)

## Requirements

- apt
- zsh

## Installation

Run [`install.sh`](./install.sh).

This installer has following options:

- `--link | -l`: Just create symbolic links. Do not install any packages.

## Usage

### Add new configuration

1. Add new configuration file under this directory.
2. Add symbolic link mapping in [`link_maps.json`](./link_maps.json)
3. Run [`install.sh`](./install.sh)
   ```sh
   ./install.sh --link
   ```
   (When `--link` option is specified, `install.sh` only creates symbolic links)
