class RecordsController < ApplicationController
  load_and_authorize_resource

  def index
    @record = current_user.last_open_record
    @record = Record.new if @record.nil?
  end

  def create
    @record = current_user.records.build(started_at: Time.now)
    current_user.records << @record if @record.save
    render :record
  end

  def update
    @record = current_user.records.find(params[:id])
    @record = Record.new if @record.update(finished_at: Time.now)
    puts @record.errors.full_messages
    render :record
  end
end
