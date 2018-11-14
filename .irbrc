require 'irb/completion'

# History configuration
require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 200
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"

# Show method
# if defined?(Bundler)
#   ENV['GEM_PATH'].split(':').each do |path|
#     gem_path = Dir.glob("#{path}/gems/show_method-*").first
#     $LOAD_PATH << "#{gem_path}/lib"
#   end
# end
# require 'show_method' rescue false
