class Movie < ApplicationRecord
  has_many :reviewers
  has_many :commenters


  class << self
    def import(file)
      spreadsheet = Roo::Spreadsheet.open(file.path)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        row = Hash[[column_name, spreadsheet.row(i)].transpose]
        movie = new
        movie.attributes = row.to_hash
        movie.save!
      end
    end

    def open_spreadsheet(file)
      Roo::CSV.new(file.path, nil, :ignore)
    end

    def column_name
      ["dvd_title", "studio", "released", "status", "sound", "versions", "price", "rating", "year", "genre", "aspect", "upc", "dvd_release_date", "movie_id", "timestamp", "updated"]
    end
  end
end
