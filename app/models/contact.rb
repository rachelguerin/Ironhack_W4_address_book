class Contact < ActiveRecord::Base
	def self.get_contacts_list
		order(name: :desc)
	end

	def self.get_contact(id)
		where(id: id).first
	end

	def check
		self.name.present? && self.address.present?
	end
end
