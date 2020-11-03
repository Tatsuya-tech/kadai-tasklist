class RemoveDetailFromTask < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :detail, :text
  end
end
