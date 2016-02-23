# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

1.upto(50) do |i|
	Contact.create(name: "name #{i}", 
					address: "address #{i}", 
					phone_number: "#{i}#{i}#{i}-#{i}#{i}#{i}#{i}",
					email_address: "email#{i}@address.com")
end

cs = Contact.all.limit(10)
cs.each {|c| c.update_attributes(favourite: 'y')}
