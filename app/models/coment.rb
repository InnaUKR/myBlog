class Coment < ActiveRecord::Base
  belongs_to :post

  validates :name, presence: true
  validates :email, length: { minimum: 2 }
  validates :body, presence: true
end
