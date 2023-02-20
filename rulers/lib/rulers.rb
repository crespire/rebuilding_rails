# frozen_string_literal: true

require_relative "rulers/version"
require_relative "rulers/array"
require_relative "rulers/routing"

module Rulers
  class Error < StandardError; end

  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, {'Content-Type' => 'text/html'}, []]
      end

      if env['PATH_INFO'] == '/'
        # env['PATH_INFO'] = '/quotes/a_quote' # send to quotes controller
        return [200, {}, File.open('public/index.html', 'r')] # send static file
        # env['PATH_INFO'] = '/home/index' # send to home controller - app changes required
        # return [ 302, { 'Location' => 'https://google.com/search?q=redirected'}, []] # send 302 redirect
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)

      begin
        text = controller.send(act)
      rescue
        return [500, { 'Content-Type' => 'text/html' }, ['We ran into an error.']]
      end

      [200, { 'Content-Type' => 'text/html' }, [text]]
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end
end
