
HMBREW_BASE=/opt/homebrew
$HMBREW_BASE/bin/brew shellenv > $DOT_GEN/homebrew.rc

source $DOT_GEN/homebrew.rc

export HOMEBREW_NO_AUTO_UPDATE=1
