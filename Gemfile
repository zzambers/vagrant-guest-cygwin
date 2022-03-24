# frozen_string_literal: true

source "https://rubygems.org"

# Specify your gem's dependencies in vagrant-guest-cygwin.gemspec
gemspec

group :development do
  gem "vagrant", git: "https://github.com/hashicorp/vagrant.git"
end
group :plugins do
  gem "vagrant-guest-cygwin", path: "."
end

gem "rake", "~> 13.0"
