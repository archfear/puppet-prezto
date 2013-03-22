# Public: Install zsh and prezto.
#
# Examples
#
#   include prezto
#
#   class { 'prezto': repo => 'archfear/prezto' }
class prezto ($repo = 'sorin-ionescu/prezto') {
  include zsh

  package {
    [
     'zsh-lovers'
    ]:
  }

  $zprezto = "/Users/${::luser}/.zprezto"
  $git_url = "https://github.com/${repo}.git"

  repository { $zprezto:
    source => $repo,
    extra  => ['--recursive']
  }

  if $repo != 'sorin-ionescu/prezto' {
    exec { 'prezto-upstream':
      command   => 'git remote add upstream https://github.com/sorin-ionescu/prezto.git && git fetch upstream',
      cwd       => $zprezto,
      unless    => 'git remote | grep upstream',
      subscribe => Repository[$zprezto]
    }
  }

  $install_cmd = 'setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
      ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done'

  exec { 'configure-prezto':
    command   => "echo '#{install_cmd}' | ${boxen::config::homebrewdir}/bin/zsh",
    unless    => "test -e /Users/${::luser}/.zpreztorc",
    subscribe => [Repository[$zprezto], Package['zsh']]
  }
}
