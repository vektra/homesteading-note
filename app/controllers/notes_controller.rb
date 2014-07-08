class NotesController < ApplicationController
  before_action :set_note,     only: [:edit, :update, :show, :destroy]

  def index
    @page_title = "Notes"
    @notes      = Note.paginate(per_page: 5, page: params[:page])
  end

  def show
    @page_title = @note.name
  end

  # require auth
  def new
    @page_title = "New Note"
    @note       = Note.new
  end

  # require auth
  def edit
    @page_title = "Editing Note &mdash; #{@note.name}"
  end

  # require auth
  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to notes_url, notice: "Note was successfully created."
    else
      render action: "new"
    end
  end

  # require auth
  def update
    if @note.update(note_params)
      redirect_to notes_url, notice: "Note was successfully updated."
    else
      render action: "edit"
    end
  end

  # require auth
  def destroy
    @note.destroy
    redirect_to notes_url
  end


  private

  def set_note
    # get all notes that match the slug from the URL:  yyyy/mm/dd/SLUG
    notes = Note.where(slug: params[:slug]).load

    # just one match, use it!
    if notes.length == 1
      @note = notes.first

    # mulitple notes on that day with that slug, use the right nth one
    elsif notes.length > 1
      @note = Note.where(year:  params[:year]  || @note.year
                 ).where(month: params[:month] || @note.month
                 ).where(day:   params[:day]   || @note.day
                 ).where(slug:  params[:slug]  || @note.slug).load.first

    # no notes that match slug, go to /notes feed
    else notes.length.zero?
      return redirect_to notes_url
    end
  end

  def note_params
    params.require(:note).permit(:content,
                                 :in_reply_to,
                                 :location_altitude,
                                 :location_latitude,
                                 :location_longitude,
                                 :location_name,
                                 :private,
                                 :published_at,
                                 :slug,
                                 :syndication,
                                 :tags)
  end
end
