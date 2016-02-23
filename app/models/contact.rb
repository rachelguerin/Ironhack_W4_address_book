class Contact < ActiveRecord::Base
	def self.get_contacts_list
		order(name: :asc)
	end

	def self.get_contact(id)
		where(id: id).first
	end

	def self.get_favourites_list
		where(favourite: "y").order(name: :asc)
	end

	def check_email
		if self.email_address.present? && !self.email_address.match(/[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}/)
			return true
		else
			return false
		end
	end

	def check_phone
		if self.phone_number.present? && !self.phone_number.match(/[0-9]/)
			return true
		else 
			return false
		end
	end

	def self.get_error(err)
		if err == "error_name"
			return "Contact name and address are required."
		elsif err == "error_email"
			return "Please enter a valid email address."
		elsif err == "error_phone"
			return "Phone number must be numeric."
		else
			return nil
		end
			
	end

	def get_favourite
		if self.favourite == 'y'
			"Yes"
		else
			"No"
		end
	end

	def set_favourite
		self.favourite = 'y'
	end	
end
