# Setup Yorick

[![Stand With Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://stand-with-ukraine.pp.ua)
![GitHub release](https://img.shields.io/github/v/release/fabasoad/setup-yorick-action?include_prereleases)
![functional-tests](https://github.com/fabasoad/setup-yorick-action/actions/workflows/functional-tests.yml/badge.svg)
![security](https://github.com/fabasoad/setup-yorick-action/actions/workflows/security.yml/badge.svg)
![linting](https://github.com/fabasoad/setup-yorick-action/actions/workflows/linting.yml/badge.svg)

This action installs a [Yorick](https://yorick.sourceforge.net).

## Supported OS

<!-- prettier-ignore-start -->
| OS      | Arch   |                    |
|---------|--------|--------------------|
| Windows | All    | :x:                |
| Linux   | x86_84 | :white_check_mark: |
| Linux   | arm    | :x:                |
| macOS   | x86_84 | :white_check_mark: |
| macOS   | arm    | :x:                |
<!-- prettier-ignore-end -->

## Prerequisites

The following tools have to be installed for successful work of this GitHub Action:
[gcc](https://gcc.gnu.org), [make](https://www.gnu.org/software/make/manual/make.html).

## Inputs

```yaml
- uses: fabasoad/setup-yorick-action@v0
  with:
    # (Optional) yorick version. Defaults to the latest version.
    version: "y_2_2_04"
    # (Optional) If "false" skips installation if yorick is already installed.
    # If "true" installs yorick in any case. Defaults to "false".
    force: "false"
    # (Optional) GitHub token that is used to send requests to GitHub API such
    # as getting latest release. Defaults to the token provided by GitHub Actions
    # environment.
    github-token: "${{ github.token }}"
```

## Outputs

<!-- prettier-ignore-start -->
| Name      | Description                         | Example |
|-----------|-------------------------------------|---------|
| installed | Whether yorick was installed or not | `true`  |
<!-- prettier-ignore-end -->

## Example usage

### Workflow configuration

```yaml
name: Test

on: push

jobs:
  setup:
    name: yorick
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v5
      - uses: fabasoad/setup-yorick-action@v0
        with:
          version: y_2_2_04
      - name: Print version
        run: yorick --version
```

### Result

```shell
Run yorick --version
Copyright (c) 2005.  The Regents of the University of California.
All rights reserved.  Yorick 2.2.04 ready.  For help type 'help'
```

## Contributions

![Alt](https://repobeats.axiom.co/api/embed/bfc59bafc868d2af2c3f3f229dab9cd83617f68b.svg "Repobeats analytics image")
