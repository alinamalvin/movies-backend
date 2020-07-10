class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :kind
      t.integer :account_id

      t.timestamps
    end
  end
end
