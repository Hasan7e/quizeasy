class Choice < ApplicationRecord
  belongs_to :question


  after_update :audit_change

  def audit_change
    Rails.logger.info("[CHOICE UPDATED] #{self.id} updated at #{Time.current}")
  end

end
