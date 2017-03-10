class CreateRecords < ActiveRecord::Migration[5.0]

  def change
    create_table :time_records do |t|
      t.belongs_to :user
      t.datetime :start_record
      t.datetime :finish_record
    end

    add_index :time_records, :user
  end

end
