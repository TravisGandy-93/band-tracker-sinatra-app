class Track < ActiveRecord::Base
  
  belongs_to :band
  belongs_to :user
end 