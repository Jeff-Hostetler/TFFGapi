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
end