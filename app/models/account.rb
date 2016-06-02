class Account < ActiveRecord::Base
	has_many :projects

	def self.search(search)
	  where("account_name LIKE ?", "%#{search}%")
	end
end
	