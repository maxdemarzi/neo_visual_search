# -*- encoding: utf-8 -*-
$:.unshift File.dirname(__FILE__)

require 'neovs_app'

map '/' do
  run App
end