class RecordsController < ApplicationController
  load_and_authorize_resource

  def index
    @record = current_user.last_open_record
    @record = Record.new if @record.nil?
    set_record_list
  end

  def create
    @record = current_user.records.build(started_at: Time.now)
    current_user.records << @record if @record.save

    set_record_list
    render :record
  end

  def update
    @record = current_user.records.find(params[:id])
    @record = Record.new if @record.update(finished_at: Time.now)

    set_record_list
    render :record
  end

  private

  def set_record_list
    @records = current_user.records.closed
  end
end
