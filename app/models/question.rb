class Question < ActiveRecord::Base
  has_many :answers

  validates_presence_of :title
  validates_length_of :title, minimum: 10
end
