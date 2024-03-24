class CreateAnimalImages < ActiveRecord::Migration[7.1]
  def change
    create_table :animal_images do |t|

      t.timestamps
    end
  end
end
