class Volunteer < ActiveRecord::Base
  validates_presence_of :address
  validates_presence_of :name
  validates_presence_of :mobile_number

  has_many :sms
end
