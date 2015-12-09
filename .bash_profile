# General Aliases
alias ls='ls -GFha';
alias sortBySize="ls -s | sort -n";
alias goDropbox='cd ~/Dropbox';
alias goDesktop='cd ~/Desktop';
alias goMAMP='cd /Applications/MAMP/htdocs';
alias mIRB='more ~/.irbrc';
alias lIRB='less ~/.irbrc';
alias getLocalIP='ipconfig getifaddr en1';
alias flushDatDNS='dscacheutil -flushcache;sudo killall -HUP mDNSResponder';
alias dateTime='date "+%F %T"';
alias deployDev='grunt push_files --target=staging && grunt push_db --target=staging';
alias deployProduction='grunt push_files --target=production && grunt push_db --target=production';
alias npmSave='npm install --save-dev';
alias reloadProfile='source ~/.bash_profile';
# For the Empire
alias watchStarWars='telnet towel.blinkenlights.nl';
# For when you need a sarcastic laugh to talk down to others.
alias HAHA='afplay -d -q 1 ~/Music/iTunes/iTunes\ Media/Music/Unknown\ Artist/'\
'Unknown\ Album/HAHA.mp3'

# -c[Grand total] -h [Human readable] -d [directory depth desired]
alias subSize='du -c -h -d 1';
alias bashProfile='more ~/.bash_profile';

#TempMonitor App docs - http://www.bresink.de/osx/216202/Docs-en/commandline.html
alias systemTemps='/Applications/TemperatureMonitor.app/Contents/MacOS/tempmonitor -f -l -a -ds';

alias lockScreen='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend';

# Delete Trash, it's a hidden folder but this should be more compatible as it's linked with Finder.
# 2>&1 > /dev/null directs only stderr to occure on console.
# Requires - https://github.com/alloy/terminal-notifier
alias emptyTrash="osascript -e 'tell app \"Finder\" to empty'; \
terminal-notifier -title 'Operation Complete' -subtitle 'Trash Deleted' -message \
'Trash has been emptied.' 2>&1 > /dev/null;";

#Hide/Show user Library folder.
alias showLibrary='chflags nohidden ~/Library/';
alias hideLibrary='chflags hidden ~/Library/';

#Check and list any new software updates available.
alias softwareCheck='sudo softwareupdate --list';

#Keep MacPorts updated frequently.
alias portSelfUpdate='sudo port -v selfupdate';

#List all installed Ruby Gems
alias listGems='gem query --local';

# Default finder views
#*** Flwv = Cover Flow View
#*** Nlsv = List View
#*** clmv = Column View
#*** icnv = Icon View
# Open everything in Finder's list view.
# (remember to pass arguments to bash aliases, need to use single quotes OR escape the $@,
# otherwise it's executed when the alises are interpreted)
alias finderView='defaults write com.apple.Finder FXPreferredViewStyle $@';

# Recursively remove all .DS_Store files from folders, sometimes needed to remove settings (folder views etc).
alias remove_ALL_DS_Store='sudo find / -name ".DS_Store" -depth -exec rm {} \;';

# Useful helper functions
# No more cd ../../../.. but up 4
up(){
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
    do
      d=$d/..
    done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}

#Extract most compressed file types
extract () {
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       rar x $1       ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *)           echo "don't know how to extract '$1'..." ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}

# Get weather data for Saint Peters
weather() {
    echo Saint Peters:
    curl -s "http://api.wunderground.com/auto/wui/geo/ForecastXML/index.xml?query=${@:-63376}" | perl -ne 's/&amp;deg;/°/g;/<title>([^<]+)/&&printf "%s: ",$1;/<fcttext>([^<]+)/&&print $1,"\n"';
}

# Define a word using collinsdictionary.com
define() {
  curl -s "http://www.collinsdictionary.com/dictionary/english/$*" | sed -n '/class="def"/p' | awk '{gsub(/.*<span class="def">|<\/span>.*/,"");print}' | sed "s/<[^>]\+>//g";
}

# PATHS
# Used for spark - https://github.com/holman/spark
export PATH=$PATH:~/Dropbox/Dev/shell/spark; 

# Vim for default editor
export EDITOR=vim;
# MacPorts Installer addition on 2012-11-10_at_19:17:50: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH;
# Finished adapting your PATH environment variable for use with MacPorts.

# Custom terminal prompt metadata
# http://osxdaily.com/2013/02/05/improve-terminal-appearance-mac-os-x/
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ ";
export CLICOLOR=1;
export LSCOLORS=ExFxBxDxCxegedabagacad;
# http://osxdaily.com/2006/12/11/how-to-customize-your-terminal-prompt/
# Settings for bash_history
export HISTCONTROL=ignoredps;
export HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S  ';

##
# Your previous /Users/creatingdrew/.bash_profile file was backed up as /Users/creatingdrew/.bash_profile.macports-saved_2012-12-17_at_03:07:13
##

# MacPorts Installer addition on 2012-12-17_at_03:07:13: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH;
# Finished adapting your PATH environment variable for use with MacPorts.

