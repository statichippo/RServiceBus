module RServiceBus

require 'test/unit'
require './lib/rservicebus/AppResource.rb'
require './lib/rservicebus/AppResource/Redis.rb'
require './lib/rservicebus/ConfigureAppResource.rb'


class ConfigureAppResourceTest < Test::Unit::TestCase

	def test_NoAppResources
		list = Hash.new
		appResources = ConfigureAppResource.new.getResources( ENV )
		assert_equal appResources.length, 0
	end

	def test_Redis
		ENV['RSB_REDIS'] = "redis://localhost:8000/jim"
        ENV['QUIET'] = "1"
		appResources = ConfigureAppResource.new.getResources( ENV )
		assert_equal appResources.length, 1
	end

end

end
