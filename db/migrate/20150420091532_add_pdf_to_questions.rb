class AddPdfToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :card_id, :string
  end
end
