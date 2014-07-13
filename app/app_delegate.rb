class AppDelegate
  def applicationDidFinishLaunching(notification)
    @polipo = Polipo.new
    @menu = StatusMenu.new(@polipo)
  end

  def applicationWillTerminate(aNotification)
    @polipo.terminate
  end

end
