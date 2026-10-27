require_relative "lib/share_space/version"

Gem::Specification.new do |spec|
  spec.name = "share_space"
  spec.version = ShareSpace::VERSION
  spec.authors = ["paydaypay1"]
  spec.email = ["paydaypay1@gmail.com"]

  spec.summary = "Provides a shared space for realtime collaboration."
  spec.description = "Users can create shared spaces among other users. When working together, updates propogate to other users and cursors are visible. Similar to Figma or Google Suite collaboration."
  spec.homepage = "https://github.com/paydaypay1/share_space"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org/"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/paydaypay1/share_space"
  spec.metadata["changelog_uri"] = "https://github.com/paydaypay1/share_space/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 8.1.4"
  spec.add_dependency "haml-rails", ">= 2.0"
end
