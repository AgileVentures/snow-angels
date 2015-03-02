class Volunteer < ActiveRecord::Base
  validates_presence_of :address
  validates_presence_of :name
  validates_presence_of :mobile_number
  validates_presence_of :last_name
  validates_presence_of :post_code
  # validates :mobile_number, length: { is: 11 }
  # validates :mobile_number, numericality: { only_integer: true }

  has_many :tasks, through: :match_task_volunteer
  has_many :clients, :through => :tasks
  has_many :texts, dependent: :destroy

  def self.search(query)
    where('name like ?', "%#{query}%")
  end

  def self.internationalize_phone_number(mobile_number)
    mobile_number = Phony.normalize(mobile_number)
    mobile_number = "+#{+44}#{mobile_number}"
    mobile_number
  end

end
