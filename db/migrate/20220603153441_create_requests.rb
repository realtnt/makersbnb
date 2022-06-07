class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.datetime :date, null: false
      t.references :user, foreign_key: { on_delete: :cascade }
      t.references :space, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
