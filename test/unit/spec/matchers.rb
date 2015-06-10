# Encoding: utf-8

# Copied from https://github.com/burtlo/ark
# Until f6f9650 release.

if defined?(ChefSpec)
  def put_ark(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:ark, :put, resource_name)
  end
end
