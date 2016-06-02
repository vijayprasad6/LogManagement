class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name
      t.belongs_to :account, index: true
      t.timestamps null: false
    end
  end
end
