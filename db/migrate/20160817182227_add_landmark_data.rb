class AddLandmarkData < ActiveRecord::Migration

  def change
    landmarks = [{:name => "BQE", :figure_id => 1, :year_completed => 1947},
      {:name => "Holland Tunnel", :figure_id => 5, :year_completed => 1927},
      {:name => "Wall Street Wall", :figure_id => 4, :year_completed => 1684},
      {:name => "Brooklyn Battery Tunnel", :figure_id => 10, :year_completed => 1973}]
    
    landmarks.each do |landmark|
      Landmark.create(landmark)
    end
  end

end
