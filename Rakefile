# -*- coding: utf-8 -*-
$:.unshift('/Library/RubyMotion/lib')
$:.unshift("~/.rubymotion/rubymotion-templates")
require 'motion/project/template/ios'

require 'bundler'
Bundler.require

def rake_mode
  case ARGV.join(' ')
  when /simulator|device|pod|\A\z/ ; :simulator
  when /spec/ ; :spec
  end
end

case rake_mode
when :spec
  Bundler.require :spec
when :simulator
  Bundler.require :simulator
end

# require 'bubble-wrap'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings

  app.name = 'my_player_app'
  app.identifier = 'com.your_domain_here.my_player_app'

  app.short_version = '0.1.0'
  # Get version from git
  #app.version = (`git rev-list HEAD --count`.strip.to_i).to_s
  app.version = app.short_version

  # RubyMotion by default selects the latest SDK you have installed,
  # if you would like to specify the SDK to assure consistency across multiple machines,
  # you can do so like the following examples
  # app.sdk_version = '8.3'
  # app.sdk_version = '7.1'

  # Target OS - Set this to the lowest version you want to support in the App Store
  # app.deployment_target = '7.1'
  # app.deployment_target = '8.0'
  app.deployment_target = '11.4'

  app.icons = Dir.glob("resources/icon*.png").map{|icon| icon.split("/").last}

  app.device_family = [:iphone, :ipad]
  app.interface_orientations = [:portrait, :landscape_left, :landscape_right, :portrait_upside_down]

  app.files += Dir.glob(File.join(app.project_dir, 'lib/**/*.rb'))

  # app.fonts = ['Oswald-Regular.ttf', 'FontAwesome.otf'] # These go in /resources
  # Or use all *.ttf fonts in the /resources/fonts directory:
  # app.fonts = Dir.glob("resources/fonts/*.ttf").map{|font| "fonts/#{font.split('/').last}"}
  app.frameworks += %w(AVFoundation)

  # app.vendor_project('vendor/Flurry', :static)
  # app.vendor_project('vendor/DSLCalendarView', :static, :cflags => '-fobjc-arc') # Using arc

  app.pods do
    pod 'SDWebImage'
  #   pod 'JGProgressHUD'
  #   pod 'SVProgressHUD'
  #   pod "FontasticIcons"
  end

  app.development do
    app.codesign_certificate = "iPhone Developer: YOURNAME"
    app.provisioning_profile = "signing/my_player_app.mobileprovision"
  end

  app.release do
    app.entitlements['get-task-allow'] = false
    app.codesign_certificate = 'iPhone Distribution: YOURNAME'
    app.provisioning_profile = "signing/my_player_app.mobileprovision"
    app.entitlements['beta-reports-active'] = true # For TestFlight

    app.seed_id = "YOUR_SEED_ID"
    app.entitlements['application-identifier'] = app.seed_id + '.' + app.identifier
    app.entitlements['keychain-access-groups'] = [ app.seed_id + '.' + app.identifier ]
  end

  app.redgreen_style = :full if rake_mode == :spec

  puts "Name: #{app.name}"
  puts "Using profile: #{app.provisioning_profile}"
  puts "Using certificate: #{app.codesign_certificate}"
end

# Remove this if you aren't using CDQ
task :"build:simulator" => :"schema:build"
