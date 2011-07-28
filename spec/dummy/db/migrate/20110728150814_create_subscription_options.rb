class CreateSubscriptionOptions < ActiveRecord::Migration
  def self.up
    create_table :subscription_options do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :subscription_options
  end
end
