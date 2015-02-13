require 'spec_helper'

describe EmployeeSerializer do
  let(:object) do
    build_serializable(
      first_name: "Bob",
      last_name: "Smith",
      email: "Smith@exmple.com",
      phone_number: "123-456-7890",
      position: "Janitor",
    )
  end

  subject { serialize(object) }

  it { is_expected.to include(first_name: "Bob") }
  it { is_expected.to include(last_name: "Smith") }
  it { is_expected.to include(email: "Smith@exmple.com") }
  it { is_expected.to include(phone_number: "123-456-7890") }
  it { is_expected.to include(position: "Janitor") }
end
