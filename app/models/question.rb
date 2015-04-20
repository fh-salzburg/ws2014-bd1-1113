class Question < ActiveRecord::Base
  has_many :answers

  validates_presence_of :title
  validates_length_of :title, minimum: 11

  after_save :create_card

  attachment :card

  def create_card
    return unless title_changed?

    document = Prawn::Document.new
    document.text title
    self.card = StringIO.new(document.render)
    save
  end
end
