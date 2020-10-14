class CreateKids < ActiveRecord::Migration[6.0]
  def change
    create_table :kids do |t|
      t.string :name
      t.date :birthday

      t.timestamps
    end
  end
end
