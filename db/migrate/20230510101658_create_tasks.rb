class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.integer :user_id, null: false, comment: 'ユーザーID'
      t.string :title, limit: 256, comment: 'タスク名'
      t.text :discriptions, comment: '説明'
      t.datetime :created_at, default: 'CURRENT_TIMESTAMP', comment: '登録日時'
      t.datetime :modified_at, comment: '更新日時'
    end
  end
end
