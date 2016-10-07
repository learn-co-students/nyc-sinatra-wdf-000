class CreateLandmarks < ActiveRecord::Migration
  def change
    create_table :landmarks do |x|
      x.string :name
      x.integer :year_completed
      x.integer :figure_id
    end
  end
end
