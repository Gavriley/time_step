class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.belongs_to :user, index: true
      t.datetime :start_record
      t.datetime :finish_record
    end
  end
end
