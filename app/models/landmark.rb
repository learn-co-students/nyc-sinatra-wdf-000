class Landmark <ActiveRecord::Base
  has_many :titles, :through => :figures
  belongs_to :figure
end
