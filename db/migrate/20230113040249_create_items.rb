class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :item_name,          null: false
      t.integer    :price,              null: false
      t.text       :explanation_text,   null: false
      t.integer    :category_id,        null: false
      t.integer    :state_id,           null: false
      t.integer    :delivery_charge_id, null: false
      t.integer    :shipper_id,         null: false
      t.integer    :shipping_date_id,   null: false
      t.references :user,               null: false, foreign_key: true

      t.timestamps
    end
  end
end
