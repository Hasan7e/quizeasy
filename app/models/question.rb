class Question < ApplicationRecord
  belongs_to :quiz
  has_many :choices, dependent: :destroy

  def label_for_choice_form
    "Q#{id} | Quiz #{quiz_id} - #{quiz.title} | #{text}"
  end
end


