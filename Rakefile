require 'rake'
require "sinatra/activerecord/rake"
require ::File.expand_path('../config/environment', __FILE__)

Rake::Task["db:create"].clear
Rake::Task["db:drop"].clear

# NOTE: Assumes SQLite3 DB
desc "create the database"
task "db:create" do
  touch 'db/db.sqlite3'
end

desc "drop the database"
task "db:drop" do
  rm_f 'db/db.sqlite3'
end

desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end

desc 'Create seed data for the database'
task "db:populate" do
  Product.destroy_all
  Product.create!(name: "Harry Potter", price_in_cents: 1299)
  Product.create!(name: "Snow", price_in_cents: 1999)
  Product.create!(name: "Game of Thrones", price_in_cents: 2199)

  User.destroy_all
  User.create!(email: "monica@gmail.com", password: "testing")
  User.create!(email: "sam@gmail.com", password: "testing")
end
