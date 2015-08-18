class Poll < ActiveRecord::Base

  belongs_to :user
  has_many :options, dependent: :destroy
  has_many :voted_identificators

  accepts_nested_attributes_for :options

  validates :title, presence: true

  scope :order_created_at, -> { order('created_at DESC') }

  def self.search(search)
    return all.where('title LIKE ?', "%#{search}%") if search
    all
  end

end
