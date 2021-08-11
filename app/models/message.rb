class Message < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :text
  end

  belongs_to :user
  has_many   :comments, dependent: :destroy

end