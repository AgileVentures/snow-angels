class Client < ActiveRecord::Base


  validates_presence_of :address
  validates_presence_of :name
  validates_presence_of :phone
  validates_presence_of :last_name

  has_many :tasks
  has_many :volunteers, :through => :tasks

  scope :ordered_by_last_name, -> { order('last_name ASC') }

  def self.search(query)
    where('name like ?', "%#{query}%")
  end

end
