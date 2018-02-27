class CreateCommenters < ActiveRecord::Migration[5.1]
  def change
    create_table :commenters do |t|
      t.references :user, foreign_key: true
      t.references :movie, foreign_key: true
      t.text :comment

      t.timestamps
    end
  end
end
