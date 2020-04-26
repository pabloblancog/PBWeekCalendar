Pod::Spec.new do |spec|
  spec.name         = "PBWeekCalendar"
  spec.version      = "0.0.1"
  spec.summary      = "Swift Week Calendar"
  spec.description  = "Swift Week calendar for your project"
  spec.homepage     = "https://github.com/pabloblancog/PBWeekCalendar"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "pabloblancog" => "pabloblancogonzalez@gmail.com" }
  spec.platform     = :ios, "11.0"
  spec.swift_version = "5.0"
  spec.source       = { :git => "https://github.com/pabloblancog/PBWeekCalendar.git", :tag => "#{spec.version}" }
  spec.source_files  = "PBWeekCalendar/PBWeekCalendar/**/*.{swift}"
  spec.resources = 'PBWeekCalendar/PBWeekCalendar/**/*.{xcassets,xib,json}'
  spec.resource_bundles = {
    'PBWeekCalendar' => [
    'PBWeekCalendar/Assets/Localization/**/*.strings'
    ]
  }
  spec.static_framework = true
  spec.dependency 'PBUtils'
end
