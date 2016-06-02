class Project < ActiveRecord::Base
	belongs_to :account
	has_many :log_views
	def self.search(search)
	  where("project_name LIKE ?", "%#{search}%")
	end
end
