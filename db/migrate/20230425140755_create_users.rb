class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: false do |t|
      t.integer :user_id, primary_key: true, comment: 'ユーザーID'
      t.string :name, limit:128, null: false, comment: '名前'
      t.string :password, limit:32, null: false, comment: 'パスワード'
      t.boolean :is_admin, default: false, comment: '管理者フラグ'
      t.boolean :is_delete, default: false, comment: '削除フラグ'
      t.datetime :created_at, default: 'CURRENT_TIMESTAMP', comment: '登録日時'
      t.datetime :modified_at, comment: '更新日時'
    end
  end
end
