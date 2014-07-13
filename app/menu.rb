class StatusMenu
  def initialize(delegate=self)
    app_name = NSBundle.mainBundle.infoDictionary['CFBundleName']
    menu = MenuMotion::Menu.new({
      sections: [{
        rows: [{
          title: "Restart",
          target: delegate,
          action: "restart"
        }, {
          title: "Config",
          target: delegate,
          action: "config",
        }]
      }, {
        rows: [{
          title: "Quit #{app_name}",
          action: "terminate:",
        }]
      }]
    })

    status_item.setMenu(menu)
  end

  def status_item
    @status_item ||= begin
      status_item = NSStatusBar.systemStatusBar.statusItemWithLength(NSSquareStatusItemLength).init
      status_item.setHighlightMode(true)

      status_image = NSImage.imageNamed("PolipoX.png")
      status_image.size = NSMakeSize(16, 16)
      status_item.setImage(status_image)

      status_item
    end
  end
end