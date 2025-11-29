class Question < ApplicationRecord
  belongs_to :quiz
  has_many :choices, dependent: :destroy

  def label_for_choice_form
    "Q#{id} | Quiz #{quiz_id} - #{quiz.title} | #{text}"
  end

  after_update :audit_change

  def audit_change
    Rails.logger.info("[QUESTION UPDATED] #{self.id} updated at #{Time.current}")
  end


end


