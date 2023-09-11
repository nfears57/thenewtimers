class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :comment
      t.integer :number_of_likes

      t.timestamps

    end
  end
end
