require 'irb/completion'

# History configuration
IRB.conf[:SAVE_HISTORY] = 2000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"

# Disable 'mutliline' support due to poor pasting performance
# see https://github.com/ruby/irb/issues/43
IRB.conf[:USE_MULTILINE] = false
