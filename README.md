# Setup Yorick

[![Stand With Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://stand-with-ukraine.pp.ua)
![GitHub release](https://img.shields.io/github/v/release/fabasoad/setup-yorick-action?include_prereleases)
![Functional Tests](https://github.com/fabasoad/setup-yorick-action/workflows/Functional%20Tests/badge.svg)
![pre-commit](https://github.com/fabasoad/setup-yorick-action/actions/workflows/pre-commit.yml/badge.svg)

This action installs a [Yorick](https://yorick.sourceforge.net).

## Prerequisites

The following tools have to be installed for successful work of this GitHub action:
[git](https://git-scm.com), [gcc](https://gcc.gnu.org), [make](https://www.gnu.org/software/make/manual/make.html).

> `macOS` and `Ubuntu` are the only supported OS at this moment

## Inputs

| Name    | Required | Description                                                                  | Default  | Possible values          |
|---------|----------|------------------------------------------------------------------------------|----------|--------------------------|
| version | No       | Yorick version that can be found [here](https://github.com/LLNL/yorick/tags) | `2.2.04` | `2.2.03`, `2.2.02`, etc. |

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
      - uses: actions/checkout@main
      - uses: fabasoad/setup-yorick-action@main
        with:
          version: 2.2.04
      - name: Print version
        run: yorick --version
        shell: sh
```

### Result

```shell
Run yorick --version
Copyright (c) 2005.  The Regents of the University of California.
All rights reserved.  Yorick 2.2.04 ready.  For help type 'help'
```
