class RemoveDateFromBehaviorLogs < ActiveRecord::Migration[6.0]
  def change
    remove_column :behavior_logs, :date, :date
  end
end
