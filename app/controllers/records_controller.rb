# top-level class documentation comment
class RecordsController < ApplicationController

  load_and_authorize_resource

  rescue_from ActiveRecord::RecordNotFound, with: -> { redirect_to records_path }

  def index
    @record = current_user.current_record
    @record = Record.new if @record.nil?
  end

  def create
    raise ActiveRecord::RecordNotFound if current_user.current_record.present?

    @record = Record.new(start_record: Time.now)
    current_user.records << @record

    render :record
  end

  def update
    raise ActiveRecord::RecordNotFound if @record.finish_record.present?

    @record = current_user.records.find(params[:id])
    @record.update(finish_record: Time.now)
    @record = Record.new

    render :record
  end
end
