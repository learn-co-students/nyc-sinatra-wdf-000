class AddTitleData < ActiveRecord::Migration

  def change
    titles = ["Mayor", "President", "Governor", "NYC Parks commissioner"]
    titles.each do |title|
      Title.create(:name => title)
    end
  end

end
