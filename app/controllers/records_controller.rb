class RecordsController < ApplicationController

  def index
    @record = current_user.current_record
    @record = Record.new if @record.nil?
  end

  def create
    redirect_to :index unless current_user.current_record.nil?

    @record = Record.new(start_record: Time.now)
    current_user.records << @record

    render :show
  end

  def update
    @record = current_user.records.find(params[:id])
    @record.update(finish_record: Time.now)
    @record = Record.new
    
    render :show
  end

end
