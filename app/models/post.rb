class Post < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait_title, on: :create

  def clickbait_title
   if !/(Won't Believe|Secret|Top [0-9]*|Guess)/.match(title)
     errors.add(:title, "needs to be clickbaity")
   end
 end
 
end
