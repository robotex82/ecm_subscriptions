class CreateSubscriptionPremia < ActiveRecord::Migration
  def self.up
    create_table :subscription_premia do |t|
      t.string :name
      t.text :description
      t.integer :price_cents, :default => 0, :null => false
      t.string :currency

      t.timestamps
    end
  end

  def self.down
    drop_table :subscription_premia
  end
end
