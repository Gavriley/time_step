module TeamsHelper

  def work_time user

    time = user.records.inject(0) do |sum, rec|
      sum + (rec.finish_record - rec.start_record)
    end

    return "#{Time.at(time).utc.strftime("%H:%M:%S")}"

  end

end
