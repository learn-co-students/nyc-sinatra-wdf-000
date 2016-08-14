class CreateFiguresAndTitles < ActiveRecord::Migration
  def change
    create_table :figures do |col|
      col.integer :title_id
      col.integer :figure_id
    end
  end
end
