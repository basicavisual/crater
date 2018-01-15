class AddFieldsToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :completed, :date
    add_column :tasks, :priority, :boolean
  end
end
