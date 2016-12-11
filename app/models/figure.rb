class Figure < ActiveRecord::Base
  has_many :landmarks
  has_many :figure_titles
  has_many :titles, :through => :figure_titles
  
  def slug
    @input = self.name.downcase.gsub(" ",'-')
  end

  def self.find_by_slug(slug)
    Song.all.find do |a|
      slug == a.slug
    end
  end
end
