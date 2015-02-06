class RemoveEmpIdFromShifts < ActiveRecord::Migration
  def change
    remove_column :shifts,  :employee_id
  end
end
