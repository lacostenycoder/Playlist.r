# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

lance = User.new(username: 'lancejordan', email: 'djlancejordan@gmail.com', password: '12344321', password_confirmation: '12344321', admin: 'true', soundcloud_username: "lacostenyc")
lance.save
