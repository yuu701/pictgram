class RenameDataColumnToComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :data, :content
  end
end
