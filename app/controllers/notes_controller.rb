class NotesController < ApplicationController
  before_action :set_note, only: [:edit, :update, :show, :destroy]

  def index
    @page_title = "Notes"
    @notes      = Note.reversed.paginate(per_page: 5, page: params[:page])
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
    if @note.slug.blank?
      notes = Note.where(year:  @note.year  || Time.now.year
                 ).where(month: @note.month || Time.now.month
                 ).where(day:   @note.day   || Time.now.day
                 ).load

      if notes.length.zero?
        @note.slug = 1
      else
        @note.slug = notes.length + 1
      end
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
