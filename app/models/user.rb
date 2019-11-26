# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true
  validates :password, length: { minimum: 3 }
  validates :email, :name, presence: true
end
