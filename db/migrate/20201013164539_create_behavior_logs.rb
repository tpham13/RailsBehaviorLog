class CreateBehaviorLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :behavior_logs do |t|
      t.date :date
      t.datetime :time
      t.string :location
      t.string :before_behavior
      t.string :behavior_content
      t.string :outcome
      t.belongs_to :kid, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
