# frozen_string_literal: true

require_relative "lib/vagrant-guest-cygwin/version"

Gem::Specification.new do |spec|
  spec.name          = "vagrant-guest-cygwin"
  spec.version       = VagrantPlugins::GuestCygwin::VERSION
  spec.authors       = ["Zdenek Zambersky"]
  spec.email         = ["zzambers@redhat.com"]

  spec.summary       = "Vagrant cygwin guest plugin"
  spec.description   = "Plugin to add support for cygwin guest"
  spec.homepage      = "https://github.com/zzambers/vagrant-guest-cygwin"
  spec.required_ruby_version = ">= 2.4.0"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/zzambers/vagrant-guest-cygwin/vagrant-guest-cygwin.git"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  # spec.bindir        = "exe"
  # spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
