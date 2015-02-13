require 'rails_helper'

RSpec.describe EmployeesController, :type => :controller do

  describe "#index" do
    it "returns JSON of all employees" do
      emp1 = create_employee
      emp2 = create_employee

      get :index

      expect(response.status).to eq(200)
      response_array = JSON.parse(response.body)["employees"]
      expect(response_array.count).to eq(2)
      expect(response_array[0]["first_name"]).to eq(emp1.first_name)
    end
  end

  describe "#show" do
    it "returns JSON of the employee" do
      emp1 = create_employee
      emp2 = create_employee

      get :show, id: emp1

      expect(response.status).to eq(200)
      response_hash = JSON.parse(response.body)["employee"]
      expect(response_hash["first_name"]).to eq(emp1.first_name)
    end
  end

  describe "#create" do
    it "allows client to post new employee" do
      expect(Employee.count).to eq(0)

      post :create, employee: {first_name: "J", last_name: "Hos", email: "example@example.com", position: "Janitor"}

      expect(Employee.count).to eq(1)
    end
  end

  describe "#update" do
    it "allows cleint to update employee" do
      emp = create_employee

      patch :update, id: emp, employee: {first_name: "Updated name"}

      expect(JSON.parse(response.body)["employee"]["first_name"]).to eq("Updated name")
    end
  end

  describe "#destroy" do
    it "allows client to DESTROY AN EMPLOYEE" do
      emp = create_employee
      expect(Employee.count).to eq(1)

      delete :destroy, id: emp

      expect(Employee.count).to eq(0)
    end
  end

end
