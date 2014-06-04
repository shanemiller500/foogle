class Thing < ActiveRecord::Base

  validates :name,
          presence: true,
          length: { minimum: 2, max: 100 }



  validates :description,
          presence: true,
          length: { minimum: 3, max: 500 }
end
