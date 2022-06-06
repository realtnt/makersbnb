class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.datetime :date, null: false
      t.references :request, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
