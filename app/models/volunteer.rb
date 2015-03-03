class Volunteer < ActiveRecord::Base
  validates_presence_of :address
  validates_presence_of :name
  validates_presence_of :mobile_number
  validates_presence_of :last_name

  has_many :tasks, through: :match_task_volunteer
  has_many :clients, :through => :tasks
  has_many :texts, dependent: :destroy

  scope :available, -> { where(availability: true) }
  scope :order_by_dbs, -> { order(dbs: :desc) }
  scope :ordered_by_last_name, -> { order(:last_name) }
  scope :first_three_dbs, -> { order_by_dbs.take 3 }

  def self.search(query)
    where('name like ?', "%#{query}%")
  end

  def self.internationalize_phone_number(mobile_number)
    mobile_number = Phony.normalize(mobile_number)
    mobile_number = "+#{+44}#{mobile_number}"
    mobile_number
  end

end
