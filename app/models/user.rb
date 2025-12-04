class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable


            # Strong password policy
            validate :strong_password

            private

            def strong_password
              return if password.blank?  # Skip if Devise is not setting a password now

              errors.add(:password, "must be at least 12 characters long") if password.length < 12

              unless password =~ /[A-Z]/
                errors.add(:password, "must include at least one uppercase letter")
              end

              unless password =~ /[a-z]/
                errors.add(:password, "must include at least one lowercase letter")
              end

              unless password =~ /\d/
                errors.add(:password, "must include at least one number")
              end

              unless password =~ /[^A-Za-z0-9]/
                errors.add(:password, "must include at least one special character")
              end
            end
end
