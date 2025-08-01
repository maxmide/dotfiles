if status is-interactive
    # Commands to run in interactive sessions can go here
    function fish_prompt
        set -l color_cwd (set_color $fish_color_cwd)
        set -l color_normal (set_color normal)

        if test "$PWD" = "$HOME"
            set cwd "~"
        else
            set cwd (basename "$PWD")
        end

        echo -n -s $color_cwd "$cwd" $color_normal ' $ '
    end
end
