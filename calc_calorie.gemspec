# frozen_string_literal: true

require_relative "lib/calc_calorie/version"

Gem::Specification.new do |spec|
  spec.name = "calc_calorie"
  spec.version = CalcCalorie::VERSION
  spec.authors = ["osatoh"]
  spec.email = ["sugar961216@gmail.com"]

  spec.summary = "Calculate your today's recommend calorie."
  spec.description = "It is easy to calculate your today's calorie with body weight and fat percentage whichever you want to loss, gain or keep."
  spec.homepage = "https://github.com/osatoh/calc_calorie"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"


  spec.metadata["homepage_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "thor"
  spec.add_development_dependency "rspec"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
