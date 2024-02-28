class AddColumnNameToTaskLists < ActiveRecord::Migration[7.1]
  def change
    add_column :task_lists, :name, :string, null: false
  end
end
