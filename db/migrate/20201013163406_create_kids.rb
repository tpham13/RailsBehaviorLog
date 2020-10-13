class CreateKids < ActiveRecord::Migration[6.0]
  def change
    create_table :kids do |t|
      t.string :name
      t.date :birthdate

      t.timestamps
    end
  end
end
