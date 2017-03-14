class RecordsController < ApplicationController
  load_and_authorize_resource

  def index
    @record = current_user.last_open_record
    @record = Record.new if @record.nil?

    @records = current_user.records.closed
  end

  def create
    @record = current_user.records.build(started_at: Time.now)

    if @record.save
      current_user.records << @record
    else
      error_message
    end

    redirect_to records_url
  end

  def update
    @record = current_user.records.find(params[:id])

    error_message unless @record.update(finished_at: Time.now)

    redirect_to records_url
  end

  private

  def error_message
    flash[:error] = @record.errors.first[1]
  end
end
