class AddProjectTitleUniquenessIndex < ActiveRecord::Migration
  def up
    add_index :projects, :title, :unique => true
  end

  def down
    remove_index :projects, :title
  end
end
