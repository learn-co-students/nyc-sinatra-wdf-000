class Title <ActiveRecord::Base
  has_many :figure_titles   #has_many figure_titles to associate figures
  has_many :figures, through: :figure_titles #has many figures through the table figure_titles. Belongs to is not plural




  






end
