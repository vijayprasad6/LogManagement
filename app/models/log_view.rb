class LogView < ActiveRecord::Base
	belongs_to :project
	belongs_to :log_type
	mount_uploader :log_file, LogFileUploader # Tells rails to use this uploader for this model.
	def self.search(project_id, log_type_id)
		  if project_id.present? &&  log_type_id.present?
		  	where("project_id = ? AND log_type_id = ? ", project_id , log_type_id) 
		  elsif project_id.present?
		  	where("project_id = ? ", project_id) 
		  elsif log_type_id.present?
		  	where("log_type_id = ? ", log_type_id)	
		  end	
	end
end
