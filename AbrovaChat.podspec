Pod::Spec.new do |s|
  s.name             = 'AbrovaChat'
  s.version          = '0.2.0'
  s.summary          = 'Real-time messaging SDK for iOS'
  s.description      = <<-DESC
    AbrovaChat is a real-time messaging SDK for iOS with WebSocket-based
    messaging, read receipts, typing indicators, presence, reactions,
    and push notification support.
  DESC

  s.homepage         = 'https://abrova.ir/cloud/abrova-chat'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Abrova' => 'support@abrova.ir' }
  s.documentation_url = 'https://abrova.ir/cloud/abrova-chat/docs/quick-start'

  s.source           = { :git => 'https://github.com/Abrova-co/abrova_chat_ios_sdk.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'
  s.swift_version = '5.9'

  s.source_files = 'AbrovaChat/Sources/**/*.swift'

  s.dependency 'SwiftCentrifuge', '~> 0.8'

  s.frameworks = 'Foundation'

  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
end
