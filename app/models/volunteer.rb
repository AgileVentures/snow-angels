class Volunteer < ActiveRecord::Base
  validates_presence_of :address
  validates_presence_of :name
  validates_presence_of :mobile_number
  validates_presence_of :last_name
  validates_presence_of :post_code
  validates :mobile_number, length: { is: 11 }
  validates :mobile_number, numericality: { only_integer: true }

  has_many :tasks
  has_many :clients, :through => :tasks

  def self.search(query)
    where('name like ?', "%#{query}%")
  end
end
