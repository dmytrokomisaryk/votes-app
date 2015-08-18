class Option < ActiveRecord::Base

  belongs_to :poll

  validates :title, presence: true,
            length: { minimum: 3 }

  def voting
    self.votes += 1
    save
  end

end
