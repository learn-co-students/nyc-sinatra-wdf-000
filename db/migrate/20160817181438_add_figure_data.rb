class AddFigureData < ActiveRecord::Migration

  def change
    names = ["Robert Moses", "Al Smith", "Theodore Roosevelt", "Peter Stuyvesant", "Boss Tweed",
      "Michael Bloomberg", "Ed Koch", "Fiorello LaGuardia", "Jimmy Walker", "Belle Moskowitz"]
    names.each do |name|
      Figure.create(:name => name)
    end
  end
end
