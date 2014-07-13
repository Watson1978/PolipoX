# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/osx'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'PolipoX'
  app.deployment_target = '10.7'
  app.archs['MacOSX'] = ['x86_64']
  app.info_plist['LSUIElement'] = true
  # app.info_plist['CFBundleIconFile'] = 'PolipoX'
end

namespace :build do
  task :polipo do
    Dir.chdir("polipo")
    system "make"
    FileUtils.cp "polipo", "../resources"
  end
end