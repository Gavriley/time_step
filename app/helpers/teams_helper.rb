# top-level class documentation comment
module TeamsHelper
  def work_time(user)
    time = user.records.inject(0) do |sum, rec|
      sum + (rec.finish_record - rec.start_record)
    end

    Time.at(time).utc.strftime('%H:%M:%S').to_s
  end
end
