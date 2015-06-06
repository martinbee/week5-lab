class Post < ActiveRecord::Base

  belongs_to :user

  validates :title, length: { maximum: 200 }, presence: true, uniqueness: {scope: :user}
  validates :link, presence: true,  uniqueness: {scope: :user}

end
