# Public: Install zsh and prezto.
#
# Examples
#
#   include prezto
#
#   class { 'prezto': repo => 'archfear/prezto' }
class prezto ($repo = 'sorin-ionescu/prezto') {
  require zsh

  package { 'zsh-lovers': }

  $home = "/Users/${::luser}"
  $zprezto = "${home}/.zprezto"
  $runcoms = "${zprezto}/runcoms"
  $git_url = "https://github.com/${repo}.git"

  repository { $zprezto:
    source => $repo,
    extra  => ['--recursive']
  }

  file { "${home}/.zlogin":
    ensure  => symlink,
    target  => "${runcoms}/zlogin",
    require => Repository[$zprezto]
  }

  file { "${home}/.zlogout":
    ensure  => symlink,
    target  => "${runcoms}/zlogout",
    require => Repository[$zprezto]
  }

  file { "${home}/.zpreztorc":
    ensure  => symlink,
    target  => "${runcoms}/zpreztorc",
    require => Repository[$zprezto]
  }

  file { "${home}/.zprofile":
    ensure  => symlink,
    target  => "${runcoms}/zprofile",
    require => Repository[$zprezto]
  }

  file { "${home}/.zshenv":
    ensure  => symlink,
    target  => "${runcoms}/zshenv",
    require => Repository[$zprezto]
  }

  file { "${home}/.zshrc":
    ensure  => symlink,
    target  => "${runcoms}/zshrc",
    require => Repository[$zprezto]
  }
}
