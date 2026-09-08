# Magiiic Update Manager tools

Useful scripts for WordPress plugins UpdatePulse Server and Magiiic Update Manager.

## Features

- `mum-helpers` sourced helpers, providing environment setup and functions
- `mum-push` push a package to UpdatePulse server
- `sync_repo` synchronize a plugin or theme from local source, as if coming from distribution (ignore dev file, honor .gitignore, .distignore)

## Installation

With composer

```bash
composer config repositories.magicoli/mum-tools vcs https://github.com/magicoli/mum-tools
composer require --dev magicoli/mum-tools:@dev
```
