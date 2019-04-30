# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

List.create(:name => 'Inbox')
Product.delete_all
Product.create(
    :title => 'quan',
    :description => 'cai quan cua tao',
    :image_url => 'example.png',
    :price => 3156
)
Product.create(
    :title => 'ao',
    :description => 'ao tao dang mat nay',
    :image_url => 'example2.png',
    :price => 2323
)