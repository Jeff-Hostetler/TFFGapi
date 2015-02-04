require 'rails_helper'
require 'json'

describe VendorsController do
  describe "#index" do
    it "returns list of vendors in JSON" do
      vendor1 = create_vendor
      vendor2 = create_vendor

      get :index

      expect(response.status).to eq(200)
      response_array = JSON.parse(response.body)
      expect(response_array[0]["name"]).to eq(vendor1.name)
      expect(response_array[0]["address"]).to eq(vendor1.address)
      expect(response_array[1]["name"]).to eq(vendor2.name)
      expect(response_array[1]["address"]).to eq(vendor2.address)

    end
  end
  describe "#show" do
    it "returns the specific vendor as JSON" do
      vendor = create_vendor

      get :show, id: vendor

      expect(response.status).to eq(200)
      response_hash = JSON.parse(response.body)
      expect(response_hash.class == Hash).to eq(true)
      expect(response_hash["name"]).to eq(vendor.name)
      expect(response_hash["address"]).to eq(vendor.address)
    end
  end

  describe "#create" do
    it "allows client to create a new vendor in db" do
      post :create, vendor: {name: "Test", address: "test location"}

      expect(Vendor.count).to eq(1)
    end
  end

  describe "#update" do
    it "allows vendor to be updated by client" do
      vendor = create_vendor

      patch :update, id: vendor, vendor: {name: "Updated name", address: "Updated location"}

      expect(Vendor.count).to eq(1)
      response_hash = JSON.parse(response.body)
      expect(response_hash["name"]).to eq("Updated name")
      expect(response_hash["address"]).to eq("Updated location")
    end
  end

  describe "#destory" do
    it "allows vendor to be deleted by client" do
      vendor = create_vendor
      expect(Vendor.count).to eq(1)

      delete :destroy, id: vendor

      expect(Vendor.count).to eq(0)
    end
  end
end
