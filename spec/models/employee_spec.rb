require 'rails_helper'

RSpec.describe Employee, :type => :model do
  it "validate presence of first name" do
    emp = Employee.create(last_name: "Hos")

    expect(emp.valid?).to eq(false)
  end
  it "validate presence of last name" do
    emp = Employee.create(first_name: "Hos")

    expect(emp.valid?).to eq(false)
  end

  it "validates presence of position" do
    emp = Employee.create(first_name: "Jeff", last_name: "Hos")

    expect(emp.valid?).to eq(false)
  end

  it "has many shifts" do
    emp = create_employee

    shift1 = create_shift(emp, 4)
    shift2 = create_shift(emp, 3)

    expect(emp.shifts.count).to eq(2)
  end
end
