class Option < ActiveRecord::Base

  belongs_to :poll

  validates :title, presence: true,
            length: { minimum: 3 }

end
