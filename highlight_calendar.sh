export GREP_COLOR="01;36"
# Source: http://www.commandlinefu.com/commands/view/9772/prettier-cal-command
cal | grep -C7 --color=auto $(date +%d)
