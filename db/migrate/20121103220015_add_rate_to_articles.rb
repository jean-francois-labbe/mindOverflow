class AddRateToArticles < ActiveRecord::Migration
  def change
    change_table(:articles) do |t|
      t.integer :rate
    end

  end
end
