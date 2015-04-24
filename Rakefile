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

desc "generate dummy data for the app"
task "db:populate" do
  puts "Generating dummy data..."
  Product.delete_all
  Product.create!(name: "How to avoid large ships", price_in_cents: 19999)
  Product.create!(name: "Fifty Shades of Grey", price_in_cents: 788)
  Product.create!(name: "South", price_in_cents: 1699)

  User.delete_all
  User.create!(username: "mochromatic", password: "secret")
end
