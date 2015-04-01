# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  text       :text
#  author     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }
  validates :author, presence: true, length: { minimum: 5 }
  validates :text, presence: true, length: { minimum: 5 }

  searchable do
    text :title, :text
    text :comments do
      comments.map { |comment| comment.body }
    end

    time :created_at
    time :updated_at
  end
end
