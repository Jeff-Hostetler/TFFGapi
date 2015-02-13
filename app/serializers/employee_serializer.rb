class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :phone_number, :position

  has_many :shifts, except: [:employee]
end
