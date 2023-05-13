class AddColumnTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :ended_at, :date, after: :discriptions, comment: '終了日'
  end
end
