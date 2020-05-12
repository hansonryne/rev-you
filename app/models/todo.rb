class Todo < ApplicationRecord
  validates :body, presence: true
  validates :status, inclusion: { in: ["Incomplete", "Reminding", "Complete"], message: "Status is not one of the permitted values" }

  attribute :status, :string, default: "Incomplete"
end
