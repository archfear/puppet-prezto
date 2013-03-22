# Prezto Puppet module for Boxen

Installs [zsh](http://www.zsh.org/) and the [prezto](https://github.com/sorin-ionescu/prezto) zsh configuration framework.

## Usage

```puppet
include prezto
```

or you have your own prezto fork:
```puppet
class { 'prezto': repo => 'archfear/prezto' }
```

See the prezto [README](https://github.com/sorin-ionescu/prezto#readme) for info on configuring your shell.

## Required Puppet Modules

* `boxen`
* `osx`
* `zsh`

## Development

Write code. Run `script/cibuild` to test it. Check the `script`
directory for other useful tools.
