# rulers/test/application_test.rb
require_relative "test_helper"

class TestApp < Rulers::Application
end

class RulersAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get "/test/index"

    assert last_response.ok?
    body = last_response.body
    assert body["The index route"]
  end

  def test_routing
    get "/test/secret"

    assert last_response.ok?
    assert last_response.body["We found a secret!"]
  end
end
