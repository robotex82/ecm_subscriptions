# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.authors = "Roberto Vasquez Angel"
  s.name = "ecm_subscriptions"
  s.summary = "Insert EcmSubscriptions summary."
  s.description = "Insert EcmSubscriptions description."
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.rdoc"]
  s.version = "0.0.1"
  s.add_dependency('mail_form')
  s.add_dependency('money')
  s.add_dependency('ecm_core')
end
