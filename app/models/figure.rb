class Figure < ActiveRecord::Base
    has_many :landmarks  #figure has many landmarks so plural.
    has_many :figure_titles #it has many figure_titles inorder to retrieve titles
    has_many :titles, through: :figure_titles #has many titles through figuretitles table







end
