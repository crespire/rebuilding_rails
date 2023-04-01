require "erubis"

module Rulers
  class Controller
    attr_reader :env

    def initialize(env)
      @env = env
    end

    def render(view_name, locals = {})
      filename = File.join "app", "views", controller_name, "#{view_name}.html.erb"
      template = File.read filename
      eruby = Erubis::Eruby.new(template)
      instance_vars = {}
      self.instance_variables.each { |var| instance_vars[var] = self.instance_variable_get var }
      eruby.result locals.merge(instance_vars)
    end

    def controller_name
      klass = self.class
      klass = klass.to_s.gsub /Controller$/, ""
      Rulers.to_underscore klass
    end
  end
end
