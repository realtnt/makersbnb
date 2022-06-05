class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :message, default: ''
      t.datetime :received
      t.references :sender
      t.references :recipient

      t.timestamps
    end
  end
end
