class UserPassword < ApplicationRecord
  # Owner view, edit, and share the password
  # View can only view the password
  # Editor can update password
  ROLES = %w{owner viewer editor}

  belongs_to :user
  belongs_to :password

  validates :role, presence: :true, inclusion: { in: ROLES }
end
