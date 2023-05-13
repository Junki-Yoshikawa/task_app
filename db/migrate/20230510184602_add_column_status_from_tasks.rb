class AddColumnStatusFromTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :status, :string, limit:1, after: :ended_at, comment: 'ステータス'
  end
end
