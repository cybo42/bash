
# Add ruby gems to the path
pathprepend $(ruby -r rubygems -e 'puts Gem.user_dir')/bin
