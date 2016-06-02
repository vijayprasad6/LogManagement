class CreateLogViews < ActiveRecord::Migration
  def change
    create_table :log_views do |t|
      t.belongs_to :project
      t.belongs_to :log_type
      t.string :log_file
      t.timestamps null: false
    end
  end
end
