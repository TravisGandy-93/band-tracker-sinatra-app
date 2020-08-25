class Band < ActiveRecord::Base
 attr_accessor :slug  
 has_many :tracks
  def slug
        self.name.downcase.split.join("-")
  end
  
  def self.find_by_slug(slug)
        self.all.detect {|o| o.slug == slug}
  end
end 