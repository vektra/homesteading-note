class StatusesController < ApplicationController
  def new
    @status = Status.new
  end

  def create
    @status = Status.new(params[:status])

    if @status.save
      redirect_to statuses_path
    else
      render :new
    end
  end

  def index
    @status   = Status.new
    @statuses = Status.order("created_at DESC")
  end

  def show
    @status = Status.find(params[:id])
  end

  def destroy
    @status = Status.find(params[:id])
    @status.destroy
    redirect_to statuses_url
  end
end
