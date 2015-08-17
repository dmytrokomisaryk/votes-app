class Poll < ActiveRecord::Base

  belongs_to :user
  has_many :options, dependent: :destroy
  accepts_nested_attributes_for :options

  validates :title, presence: true

  def self.search(search)
    return all.where('title LIKE ?', "%#{search}%") if search
    all
  end

end
