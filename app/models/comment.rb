class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event

  has_many :answers, dependent: :destroy 

  validates :body, presence: true, allow_blank: false
end