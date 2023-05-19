class CreateLabels < ActiveRecord::Migration[7.0]
  def change
    create_table :labels do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, limit: 256, comment: 'ラベル名'
      t.string :color, limit: 256, comment: '色'
      t.datetime :created_at, default: 'CURRENT_TIMESTAMP', comment: '登録日時'
      t.datetime :modified_at, comment: '更新日時'
    end
  end
end
