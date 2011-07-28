class CreateSubscriptionOptions < ActiveRecord::Migration
  def self.up
    create_table :subscription_options do |t|
      # t.string :name
      t.integer :months
      t.integer :price_cents, :default => 0, :null => false
      t.string :currency
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :subscription_options
  end
end
