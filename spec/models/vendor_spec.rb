require 'rails_helper'

RSpec.describe Vendor, :type => :model do

  it "vendor must have a name" do
    vendor = Vendor.create(address: "1234 Fake St")

    expect(vendor.valid?).to eq(false)
  end

  it "vendor must have an address" do
    vendor = Vendor.create(name: "Guy")

    expect(vendor.valid?).to eq(false)
  end

  it "complete vendor is valid" do
    vendor = create_vendor

    expect(vendor.valid?).to eq(true)

  end

end
