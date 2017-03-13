class RenameStartRecordAndFinishRecordToRecords < ActiveRecord::Migration[5.0]
  def change
    rename_column(:records, :start_record, :started_at)
    rename_column(:records, :finish_record, :finished_at)
  end
end
