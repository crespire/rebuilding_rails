# rulers/test/test_helper.rb
$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
$LOAD_PATH << File.join(File.dirname(__FILE__), "app", "controllers")
$LOAD_PATH << File.join(File.dirname(__FILE__), "app", "views")

require "rulers"
require "rack/test"
require "minitest/autorun"

