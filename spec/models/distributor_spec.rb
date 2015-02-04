require 'rails_helper'

RSpec.describe Distributor, :type => :model do

  it "distributor must have a name" do
    distributor = Distributor.create(address: "1234 Fake St")

    expect(distributor.valid?).to eq(false)
  end

  it "distributor must have an address" do
    distributor = Distributor.create(name: "Guy")

    expect(distributor.valid?).to eq(false)
  end

  it "complete distributor is valid" do
    distributor = create_distributor

    expect(distributor.valid?).to eq(true)

  end

end
