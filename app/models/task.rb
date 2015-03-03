class Task < ActiveRecord::Base
  has_many :volunteers, through: :match_task_volunteer
  belongs_to :client

  scope :to_be_assigned, -> { where(task_done: nil, volunteer_id: nil) }
  scope :done, -> { (where task_done: true) }
  scope :assigned, -> { done.where.not(volunteer_id: nil) }
  # scope :assigned, -> { where "volunteer_id IS NOT NULL AND task_done IS NULL" }

  def geocoder_lat(post_code)
    location = Geocoder.search(post_code)
    location[0].latitude
  end

  def geocoder_long(post_code)
    location = Geocoder.search(post_code)
    location[0].longitude
  end

end
