set -l dir ~/Dropbox/notes

set -l files (
    rg --sortr modified -l "$argv" $dir
)

set -l file (
    for f in $files;
        echo -ns (basename $f) (set_color brblack) " ▷ "
        set -l preview (head -1 $f)
        if test (string match -r '^:' $preview)
            echo -ns $preview
        end
        set_color normal
        echo ""
    end \
    | fzf \
        --ansi \
        +s \
        --preview="cat (string join '' $dir / {1})" \
        --bind "?:toggle-preview" \
        --preview-window hidden \
        --preview-window=up \
        --color=16,border:bright-black \
        --delimiter=" ▷ " \
    | string match -rg '^(.*) ▷'
)

if test -n "$file"
    vim +Goyo "$dir/$file"
    bu
    exit 0
else
    exit 1
end
