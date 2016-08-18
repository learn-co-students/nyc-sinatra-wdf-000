class AddFigureTitleData < ActiveRecord::Migration
  def change
    joins = [
      {:title_id => 3, :figure_id => 2},
      {:title_id => 3, :figure_id => 3},
      {:title_id => 2, :figure_id => 3},
      {:title_id => 1, :figure_id => 9},
      {:title_id => 4, :figure_id => 1}
    ]
    joins.each{|join| FigureTitle.create(join)}
  end
end
