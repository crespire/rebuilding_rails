# rulers/test/test_helper.rb
$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require "rulers"
require "rack/test"
require "minitest/autorun"