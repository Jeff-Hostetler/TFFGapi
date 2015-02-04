class AddDistributorTable < ActiveRecord::Migration
  def change
    create_table :distributors do |t|
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
