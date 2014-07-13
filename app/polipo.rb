class Polipo
  def initialize
    create_cachedir()
    start()
  end

  def start
    unless @task
      polipo = File.join(NSBundle.mainBundle.resourcePath, 'polipo')
      config = File.join(NSBundle.mainBundle.resourcePath, 'config')
      @task = NSTask.new
      @task.arguments = ['-c', config]
      @task.launchPath = polipo
      @task.launch
    end
  end

  def terminate
    @task.terminate if @task
    @task = nil
  end

  def restart
    terminate()
    start()
  end

  def config
    url = NSURL.URLWithString("http://localhost:8123/polipo/config")
    NSWorkspace.sharedWorkspace.openURL(url)
  end

  private

  def create_cachedir
    app_name = NSBundle.mainBundle.infoDictionary['CFBundleName']
    path = File.expand_path("~/Library/Application Support/#{app_name}")
    cache_dir = File.join(path, "cache")
    Motion::FileUtils.mkdir_p(cache_dir) unless File.exist?(cache_dir)
  end

end