class CreateGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :genres do |t|
      t.string :title
      t.string :slug

      t.timestamps
    end
  end
end
