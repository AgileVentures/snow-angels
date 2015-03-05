class Task < ActiveRecord::Base
  has_many :volunteers, through: :match_task_volunteer
  belongs_to :client

  scope :to_be_assigned, -> { where(task_done: nil, volunteer_id: nil) }
  scope :done, -> { (where task_done: true) }
  scope :not_done, -> { (where task_done: nil) }
  scope :assigned, -> { where.not(volunteer_id: nil).not_done }
  scope :todays_tasks, -> { where('created_at >= ?', Time.zone.now.beginning_of_day) }

  def geocoder_lat(post_code)
    location = Geocoder.search(post_code)
    location[0].latitude unless location.empty?
  end

  def geocoder_long(post_code)
    location = Geocoder.search(post_code)
    location[0].longitude unless location.empty?
  end

  def volunteer
    Volunteer.find(self.volunteer_id).name
  end

  def self.set_volunteer_availability(task, chosen_volunteer)
    @task = Task.find(task)
    @volunteer = Volunteer.find(chosen_volunteer)
    @task.volunteer_id = @volunteer.id
    @task.save
    @volunteer.availability = false
    @volunteer.save
  end

end
