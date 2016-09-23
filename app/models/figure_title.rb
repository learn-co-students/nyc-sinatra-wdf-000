class FigureTitle < ActiveRecord::Base
  belongs_to :title
  belongs_to :figure

  def slug
    @input = self.name.downcase.gsub(" ",'-')
  end

  def self.find_by_slug(slug)
    Song.all.find do |a|
      slug == a.slug
    end
  end
  
end
