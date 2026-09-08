# Magiiic Update Manager tools

Useful development scripts and tools for the **Magiiic Update Manager (MUM)** ecosystem built around Anyape's [UpdatePulse Server](https://github.com/Anyape/updatepulse-server): WordPress plugin and themes updates server.

Packages using these tools include:

- [MUM Server](https://github.com/magicoli/mum-server): UpdatePulse Server companion additions
- [MUM Multi-Package client](https://github.com/magicoli/mum-multi-package) Centralize updates for a curated collection of plugins and themes
- [Woopus](https://github.com/magicoli/woopus) WooCommerce UpdatePulse integration (sell licenses, use package metadata to display products...)

## Features

- `mum-helpers` sourced helpers, providing environment setup and functions
- `mum-push` push a package to UpdatePulse server
- `sync_repo` synchronize a plugin or theme from local source, as if coming from distribution (ignore dev file, honor .gitignore, .distignore)

## Installation

With composer:

```bash
composer config repositories.magicoli/mum-tools vcs https://github.com/magicoli/mum-tools
composer require --dev magicoli/mum-tools
export PATH="{$path_to_repo}/vendor/bin:$PATH"
```

Or as a submodule:

```bash
git submodule add https://github.com/magicoli/mum-tools bin
export PATH="{$path_to_repo}/bin:$PATH"
```
