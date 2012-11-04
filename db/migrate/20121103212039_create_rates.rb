class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.references :rateable, :polymorphic => true
      t.references :user

      t.timestamps
    end
  end
end
