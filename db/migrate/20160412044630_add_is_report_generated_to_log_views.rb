class AddIsReportGeneratedToLogViews < ActiveRecord::Migration
    def up
    add_column :log_views, :is_report_generated, :boolean, :default => false
    end

    def down
    remove_column :log_views, :is_report_generated, :boolean,  :default => nil
    end
end
