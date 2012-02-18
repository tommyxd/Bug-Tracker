class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title
      t.text :content
      t.string :status
      t.integer :priority
      t.integer :project_id

      t.timestamps
    end
  end
end
