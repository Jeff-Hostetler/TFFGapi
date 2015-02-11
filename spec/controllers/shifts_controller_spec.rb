require 'rails_helper'

RSpec.describe ShiftsController, :type => :controller do

  describe "#index" do
    it "returns JSON of all shifts" do
      emp = create_employee
      shift1 = create_shift(emp, 4)
      shift2 = create_another_shift(emp, 4)

      get :index
      expect(response.status).to eq(200)
      response_array = JSON.parse(response.body)["shifts"]
      expect(response_array.count).to eq(2)
      expect(response_array[0]["employee_id"]).to eq(emp.id)
    end
  end

end
