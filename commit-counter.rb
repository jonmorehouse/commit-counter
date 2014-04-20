#!/usr/bin/env macruby

framework 'Cocoa'

class MyAppDelegate

  def initialize

    @base_dir = File.expand_path "~/.commits"
    
  end

  def applicationDidFinishLaunching(notification)

    menu = NSMenu.new
    menu.initWithTitle "Commit Counter"

    statusBar = NSStatusBar.systemStatusBar
    @item = item = statusBar._statusItemWithLength(0, withPriority:2137483647)
    item.length = 0
    item.length = NSVariableStatusItemLength
    NSTimer.scheduledTimerWithTimeInterval(1.0, target:self, selector: :"handler:", userInfo:nil, repeats:true)

  end

  def handler(sender)

    # generate today's file
    filename = Time.now.strftime("%a-%b-%d").downcase
    path = File.join @base_dir, filename

    if not File.exist? path
      @item.update 0
    end

    # read lines of file
    count = %x{wc -l #{path}}.split.first.to_i

    # now count the number of lines in file
    @item.title = count



  end

end

app = NSApplication.sharedApplication
app.delegate = MyAppDelegate.new
app.run
