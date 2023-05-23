class ChangeDataDescriptionToTask < ActiveRecord::Migration[7.0]
  def change
    change_column :tasks, :status, :integer, using: 'status::integer'
  end
end
