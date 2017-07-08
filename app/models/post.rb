class Post < ActiveRecord::Base

  before_validation :not_clickbait
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction","Non-Fiction"] }

  def not_clickbait
    return false if self.title.nil?
    bad_titles = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    bad_titles.map{|bad| self.title.include?(bad) ? true : false}.include?(true)
  end

end
