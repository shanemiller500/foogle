class Thing < ActiveRecord::Base

  validates :name,
          presence: true,
          length: { minimum: 2, max: 100 }

  validates :description,
          length: { minimum: 3, max: 1000 }
end
