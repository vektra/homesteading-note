class NotesController < ApplicationController
  def index
    @notes = Note.all

    respond_to do |format|
      format.html
      format.json { render json: @notes }
    end
  end

  def show
    @note = Note.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @note }
    end
  end

  # require auth
  def new
    @note = Note.new

    respond_to do |format|
      format.html
      format.json { render json: @note }
    end
  end

  # require auth
  def edit
    @note = Note.find(params[:id])
  end

  # require auth
  def create
    @note = Note.new(params[:note])

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: "Note was successfully created." }
        format.json { render json: @note, note: :created, location: @note }
      else
        format.html { render action: "new" }
        format.json { render json: @note.errors, note: :unprocessable_entity }
      end
    end
  end

  # require auth
  def update
    @note = Note.find(params[:id])

    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to @note, notice: "Note was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @note.errors, note: :unprocessable_entity }
      end
    end
  end

  # require auth
  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.html { redirect_to notes_path }
      format.json { head :no_content }
    end
  end
end
