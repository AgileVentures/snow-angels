class Client < ActiveRecord::Base

  validates_presence_of :address
  validates_presence_of :name
  validates_presence_of :phone
  validates_presence_of :last_name
  validates_presence_of :postcode

  has_many :tasks
  has_many :volunteers, :through => :tasks

  def self.search(query)
    where('name like ?', "%#{query}%")
  end

end
