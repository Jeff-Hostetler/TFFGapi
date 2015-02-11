require 'rails_helper'
require 'json'

describe DistributorsController do
  describe "#index" do
    it "returns list of distributors in JSON" do
      distributor1 = create_distributor
      distributor2 = create_distributor

      get :index

      expect(response.status).to eq(200)
      response_array = JSON.parse(response.body)["distributors"]
      expect(response_array[0]["name"]).to eq(distributor1.name)
      expect(response_array[0]["address"]).to eq(distributor1.address)
      expect(response_array[1]["name"]).to eq(distributor2.name)
      expect(response_array[1]["address"]).to eq(distributor2.address)

    end
  end
  describe "#show" do
    it "returns the specific distributor as JSON" do
      distributor = create_distributor

      get :show, id: distributor

      expect(response.status).to eq(200)
      response_hash = JSON.parse(response.body)["distributor"]
      expect(response_hash.class == Hash).to eq(true)
      expect(response_hash["name"]).to eq(distributor.name)
      expect(response_hash["address"]).to eq(distributor.address)
    end
  end

  describe "#create" do
    it "allows client to create a new distributor in db" do
      expect(Distributor.count).to eq(0)

      post :create, distributor: {name: "Test", address: "test location"}

      expect(Distributor.count).to eq(1)
    end
  end

  describe "#update" do
    it "allows distributor to be updated by client" do
      distributor = create_distributor

      patch :update, id: distributor, distributor: {name: "Updated name", address: "Updated location"}

      expect(Distributor.count).to eq(1)
      response_hash = JSON.parse(response.body)["distributor"]
      expect(response_hash["name"]).to eq("Updated name")
      expect(response_hash["address"]).to eq("Updated location")
    end
  end

  describe "#destory" do
    it "allows distributor to be deleted by client" do
      distributor = create_distributor
      expect(Distributor.count).to eq(1)

      delete :destroy, id: distributor

      expect(Distributor.count).to eq(0)
    end
  end
end
