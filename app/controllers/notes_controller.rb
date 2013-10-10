class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @page_title = "Notes"
    @notes   = Note.paginate(per_page: 5,
                                   order:    "published_at DESC",
                                   page:     params[:page])
  end

  def show
    @page_title = @note.name
  end

  # require auth
  def new
    @page_title = "New Note"
    @note    = Note.new
  end

  # require auth
  def edit
    @page_title = "Editing Note &mdash; #{@note.name}"
  end

  # require auth
  def create
    @note = Note.new(note_params)
    set_datetime_fields
    set_slug

    if @note.save
      redirect_to notes_url, notice: "Note was successfully created."
    else
      render action: "new"
    end
  end

  # require auth
  def update
    set_datetime_fields
    set_slug

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
    # get all notes that match the YYYY/MM/DD/SLUG from the URL
    notes = Note.where(year:  params[:year]
                     ).where(month: params[:month]
                     ).where(day:   params[:day]
                     ).where(slug:  params[:slug]).load

    # no notes that match URL, go to /notes feed
    if notes.length.zero?
      return redirect_to notes_url
    # mulitple notes on that day with that slug, use the right nth one
    elsif notes.length > 1
      index    = params[:nth_of_day].to_i - 1
      @note = notes[index]
    # just one match, use it!
    else
      @note = notes.first
    end
  end

  def set_datetime_fields
    if params[:note][:published_at].blank?
      @note.year   = Time.now.year
      @note.month  = Time.now.month
      @note.day    = Time.now.day
      @note.hour   = Time.now.hour
      @note.minute = Time.now.min
      @note.second = Time.now.sec
    else
      @note.year   = Time.parse(params[:note][:published_at]).year
      @note.month  = Time.parse(params[:note][:published_at]).month
      @note.day    = Time.parse(params[:note][:published_at]).day
      @note.hour   = Time.parse(params[:note][:published_at]).hour
      @note.minute = Time.parse(params[:note][:published_at]).min
      @note.second = Time.parse(params[:note][:published_at]).sec
    end
  end

  def set_slug
    blank     = ""
    separator = "-"

    if params[:note][:slug].blank?
      name = "#{@note.title} #{@note.subtitle}"
    else
      name = params[:note][:slug]
    end

    name.downcase.gsub(/\(|\)|\[|\]/, "").
      gsub(/\./,       separator).
      gsub(/-$|,|!|'/, blank).
      gsub(/&amp;/,    blank).
      gsub(/-/,        separator).
      gsub(/ /,        separator)
  end

  def note_params
    params.require(:note).permit(:title, :subtitle, :content, :in_reply_to, :tags, :syndication, :slug, :location_name, :location_latitude, :location_longitude, :location_altitude, :private, :published_at)
  end
end
