#!/usr/bin/env pry
require 'pry'
require 'rspec'
require 'capybara/dsl'
include Capybara::DSL
include RSpec::Matchers

Capybara.default_driver = :selenium

visit "http://www.shino.de/parkcalc/"

binding.pry
