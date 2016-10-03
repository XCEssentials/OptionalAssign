Pod::Spec.new do |s|

  s.name                      = 'MKHOptionalAssign'
  s.version                   = '2.0.0'
  s.summary                   = 'Custom assign operator that safely unwraps and assigns non-nil optionals only.'
  s.homepage                  = 'https://github.com/maximkhatskevich/#{s.name}'
  s.license                   = { :type => 'MIT', :file => 'LICENSE' }
  s.author                    = { 'Maxim Khatskevich' => 'maxim@khatskevi.ch' }
  s.ios.deployment_target     = '8.0'
  s.source                    = { :git => '#{s.homepage}.git', :tag => '#{s.version}' }
  s.ios.source_files          = 'Src/*.swift'
  s.requires_arc              = true
  s.social_media_url          = 'http://www.linkedin.com/in/maximkhatskevich'

end
