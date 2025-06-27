set -l dir ~/Dropbox/notes
set -l prefix (date +"%Y-%m-%d")
set -l name $argv
vim +Goyo "$dir/$prefix $name.md"
# cd $dir && bu
