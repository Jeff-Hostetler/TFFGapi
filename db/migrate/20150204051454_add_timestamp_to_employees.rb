class AddTimestampToEmployees < ActiveRecord::Migration
  def change
    def change_table
      add_column(:employees, :created_at, :datetime)
      add_column(:employees, :updated_at, :datetime)
    end
  end
end
