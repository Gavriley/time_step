# top-level class documentation comment
module TeamsHelper
  def work_time(user)
    time = user.records.where.not(finish_record: nil).inject(0) do |sum, rec|
      sum + (rec.finish_record - rec.start_record)
    end

    Time.at(time).utc.strftime('%H:%M:%S').to_s
  end
end
