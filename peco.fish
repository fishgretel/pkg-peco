function init --on-event init_peco
  set -l peco_bin (which peco)
  if not test -n "$peco_bin"
    echo "⚫  Please install 'peco' first: brew install peco"
  else
    function peco_select_history
      history|peco|read slct
      if [ $slct ]
        commandline $slct
      else
        commandline ''
      end
    end

    function fish_user_key_bindings
      bind \cx __exit
      bind \cr peco_select_history
    end
  end
end
