class User < ApplicationRecord
    has_many :bank_accounts

    
    # validates
    validates :name, presence: true
    validates :email, presence: true
    validates :name, inclusion: { in: %w( admin super_admin ) }
    validates :name, uniqueness: true
    validate :name_should_not_be_email

    private
    def name_should_not_be_email
        errors.add(:name, "should not be email") if name == email
    end
end
