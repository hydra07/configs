if status is-interactive
  set fish_greeting ""
  
  set -gx TERM xterm-256color

  # THEME
  set -g theme_color_scheme terminal-dark
  set -g fish_prompt_pwd_dir_length 2
  set -g theme_display_user yes
  set -g theme_hide_hostname no
  set -g theme_hostname always
  
  set -gx EDITOR nvim
  
  # PATH
  set -gx PATH bin $PATH
  set -gx PATH ~/bin $PATH
  set -gx PATH ~/.local/bin $PATH
  set -gx PATH ~/.bun/bin $PATH

  # NVM
  function __check_rvm --on-variable PWD --description 'Do nvm stuff'
      status --is-command-substitution; and return
      if test -f .nvmrc; and test -r .nvmrc
          nvm use
        else
      end
  end

  # CONFIG OS
  switch (uname)
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
    case '*'
        source (dirname (status --current-filename))/config-windows.fish
  end

  # ACTIVATE
  mise activate fish | source 
  starship init fish | source
end

