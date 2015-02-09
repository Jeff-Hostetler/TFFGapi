require 'rails_helper'

RSpec.describe Shift, :type => :model do
  it "belongs to an employee" do
    emp = create_employee
    shift = create_shift(emp, 4)

    expect(shift.employee_id).to eq(emp.id)
  end
  it "validates start_time" do
    emp = create_employee
    shift1 = create_shift(emp, 4)
    shift2 = Shift.create(end_time: Time.now, employee_id: emp.id)

    expect(shift1.valid?).to eq(true)
    expect(shift2.valid?).to eq(false)
  end
  it "validates end_time" do
    emp = create_employee
    shift1 = create_shift(emp, 4)
    shift2 = Shift.create(start_time: Time.now, employee_id: emp.id)

    expect(shift1.valid?).to eq(true)
    expect(shift2.valid?).to eq(false)
  end

end
