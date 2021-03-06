#
# rb_main.rb
# Pastis
#
# Created by Matt Aimonetti on 6/13/10.
# Copyright m|a agile 2010. All rights reserved.
#

# Loading the Cocoa framework. If you need to load more frameworks, you can
# do that here too.
framework 'Cocoa'

dir_path = NSBundle.mainBundle.resourcePath.fileSystemRepresentation
require File.expand_path('pastis', dir_path)
# require dir_path.join('filter_window_controller')

# Loading all the Ruby project files.
main = File.basename(__FILE__, File.extname(__FILE__))

Dir.glob(File.join(dir_path, '*.{rb,rbo}')).map { |x| File.basename(x, File.extname(x)) }.uniq.each do |path|
  if path != main
    require(path)
  end
end

# Pastis.new.check

# Starting the Cocoa main loop.
NSApplicationMain(0, nil)