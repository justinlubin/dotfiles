set -l dir ~/Dropbox/notes

# set -l tags (fish ~/dotfiles/show-tags.fish | string join ':')

set -l files (ls -d $dir/*)

if test -n "$argv"
    set -l files (
        rg --sortr modified -l "$argv" $dir
    )
end

set -l queryfile (
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
        --color=16,border:bright-black,label:bright-black \
        --delimiter=" ▷ " \
        --print-query
)

set -l query $queryfile[1]
set -l file (string match -rg '^(.*) ▷' $queryfile[2])

if test (string match -r '^!' $query)
    set -l prefix (date +"%Y-%m-%d")
    set -l name (string trim -c '!' $query)
    set -l suffix ".md"

    if test -n "$name"
        set prefix "$prefix "
    end

    set file "$prefix$name$suffix"
end

if test -n "$file"
    cd "$dir"
    vim +Goyo "$file"
    # cd $dir && bu
    exit 0
else
    exit 1
end
