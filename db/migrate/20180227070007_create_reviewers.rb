class CreateReviewers < ActiveRecord::Migration[5.1]
  def change
    create_table :reviewers do |t|
      t.references :user, foreign_key: true
      t.references :movie, foreign_key: true
      t.integer :rating_point

      t.timestamps
    end
  end
end
