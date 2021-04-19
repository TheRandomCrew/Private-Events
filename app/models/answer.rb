class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :comment

  validates :body, presence: true, allow_blank: false
end
