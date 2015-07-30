class Movie < ActiveRecord::Base

  has_many :reviews

  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :director, presence: true
  validates :runtime_in_minutes, numericality: { only_integer: true }
  validates :description, presence: true
  validates :release_date, presence: true
  validate  :release_date_is_in_the_future

  
scope :search, lambda {|search| 
  where("title LIKE ? or director LIKE ?", "%#{search}%", "%#{search}%")
}


  def self.by_length(movie_duration)
    if movie_duration == "Under 90 minutes"
      where("runtime_in_minutes < 90", "%#{movie_duration}%")
    elsif movie_duration == "Between 90 and 120 minutes"
      where("runtime_in_minutes >= 90 AND runtime_in_minutes <= 120", "%#{movie_duration}%")
    else
      where("runtime_in_minutes > 120", "%#{movie_duration}%")
    end
  end

  def review_average
    unless reviews.empty?
      reviews.sum(:rating_out_of_ten)/reviews.size
    else
      0
    end
  end

  protected

  def release_date_is_in_the_future
    if release_date.present?
      errors.add(:release_date, "should probably be in the future") if release_date < Date.today
    end
  end

end
