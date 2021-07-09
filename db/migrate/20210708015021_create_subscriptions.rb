class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.integer :reader_id
      t.integer :magazine_id
      t.integer :price
    end
  end
end
