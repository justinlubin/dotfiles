set -l dir ~/Dropbox/notes
for f in (ls $dir)
    string match -rg '^:(.*):' (head -1 $f) | string split ':'
end | sort | uniq
