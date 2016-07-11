class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string :title
      t.text :description
      t.string :features

      t.timestamps
    end
  end
end
