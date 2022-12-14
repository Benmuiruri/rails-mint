class Group < ApplicationRecord
  belongs_to :user
  has_many :group_expenses
  has_many :expenses, through: :group_expenses

  validates :name, presence: true, length: { in: 3..20 }
  validates :icon, presence: true

  def total_expenses
    expenses.sum(&:amount)
  end
end
