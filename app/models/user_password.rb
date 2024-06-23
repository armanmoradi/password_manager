class UserPassword < ApplicationRecord
  # Owner view, edit, and share the password
  # View can only view the password
  # Editor can update password
  ROLES = %w{owner editor viewer}

  belongs_to :user
  belongs_to :password

  validates :role, presence: :true, inclusion: { in: ROLES }

  attribute :role, default: :viewer


  def editable?
    owner? || editor?
  end

  def shareable?
    owner?
  end

  def deletable?
    owner?
  end

  private

  def owner?
    role == "owner"
  end

  def viewr?
    role == "viwer"
  end

  def editor?
    role == "editor"
  end

end
