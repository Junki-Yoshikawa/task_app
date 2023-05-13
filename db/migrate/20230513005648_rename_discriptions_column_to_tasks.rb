class RenameDiscriptionsColumnToTasks < ActiveRecord::Migration[7.0]
  def change
    rename_column :tasks, :discriptions, :description
  end
end
