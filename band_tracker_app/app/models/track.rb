class Track < ActiveRecord::Base
   extend Slugified::ClassMethods
  include Slugified::InstanceMethods
 belongs_to :band
 belongs_to :user
end 