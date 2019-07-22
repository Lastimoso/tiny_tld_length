
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tiny_tld_length/version"

Gem::Specification.new do |spec|
  spec.name          = "tiny_tld_length"
  spec.version       = TinyTldLength::VERSION
  spec.authors       = ["Gerardo Raiden"]
  spec.email         = ["gerardoraiden@gmail.com"]

  spec.summary       = %q{Return the right tld_length parsing the host against the Public Suffix List}
  spec.description   = %q{TinyTldLength allows you to get the correct subdomains and domain of a host, parsing it against the Public Suffix List. Get all domains rigth (not only co.uk and other usual suspects). It keeps a cached version of the list to avoid an online verification with every request. Our focus is keep it ultra-light as it would be often used with every request (For instance, to get the correct subdomain in a multi-tenant app).}
  spec.homepage      = "https://github.com/Lastimoso/tiny_tld_length"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
