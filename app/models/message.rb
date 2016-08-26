class Message < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "author_id"

  validates :author, :content, presence: true
end
