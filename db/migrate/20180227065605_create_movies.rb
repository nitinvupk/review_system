class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :dvd_title
      t.string :studio
      t.string :released
      t.string :status
      t.string :sound
      t.string :versions
      t.string :price
      t.string :rating
      t.string :year
      t.string :genre
      t.string :aspect
      t.string :upc
      t.string :dvd_release_date
      t.string :movie_id
      t.string :timestamp
      t.string :updated

      t.timestamps
    end
  end
end
