Pod::Spec.new do |s|
  s.name             = 'AbrovaChatUI'
  s.version          = '0.2.0'
  s.summary          = 'Pre-built UI components for AbrovaChat iOS SDK'
  s.description      = <<-DESC
    AbrovaChatUI provides ready-to-use SwiftUI components for chat applications
    including message bubbles, input fields, typing indicators, presence dots,
    reaction pickers, read receipts, and more.
  DESC

  s.homepage         = 'https://abrova.ir/cloud/abrova-chat'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Abrova' => 'support@abrova.ir' }
  s.documentation_url = 'https://abrova.ir/cloud/abrova-chat/docs/quick-start'

  s.source           = { :git => 'https://github.com/Abrova-co/abrova_chat_ios_sdk.git', :tag => s.version.to_s }

  s.ios.deployment_target = '15.0'
  s.swift_version = '5.9'

  s.source_files = 'AbrovaChatUI/Sources/**/*.swift'

  s.dependency 'AbrovaChat', '~> 0.2'
  s.dependency 'SDWebImageSwiftUI', '~> 3.0'

  s.frameworks = 'SwiftUI'

  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
end
