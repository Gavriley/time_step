# top-level class documentation comment
module TeamsHelper
  def work_time(user)
    time = user.records.closed.inject(0) do |sum, rec|
      sum + (rec.finished_at - rec.started_at)
    end

    Time.at(time).utc.strftime('%H:%M:%S').to_s
  end
end
