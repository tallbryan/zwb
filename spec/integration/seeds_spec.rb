require 'spec_helper'

feature "Seed Data" do
	scenario "The basics"
	load Rails.root + "db/seeds.rb"
end