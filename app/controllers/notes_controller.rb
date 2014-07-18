class NotesController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show, :destroy]
  respond_to    :html, :atom

  def index
    @page_title = "Notes"
    @posts      = Note.paginate(per_page: 5, page: params[:page])

    respond_with @posts
  end

  def show
    @page_title = @post.name
  end

  # require auth
  def new
    @page_title = "New Note"
    @post       = Note.new
  end

  # require auth
  def edit
    @page_title = "Editing Note - #{@post.name}"
  end

  # require auth
  def create
    @post = Note.new(post_params)
    if @post.save
      redirect_to notes_url, notice: "Note was successfully created."
    else
      render action: "new"
    end
  end

  # require auth
  def update
    if @post.update(post_params)
      redirect_to notes_url, notice: "Note was successfully updated."
    else
      render action: "edit"
    end
  end

  # require auth
  def destroy
    @post.destroy
    redirect_to notes_url
  end


  private

  def set_post
    # get all notes that match the slug from the URL:  yyyy/mm/dd/SLUG
    notes = Note.where(slug: params[:slug]).load

    # just one match, use it!
    if notes.length == 1
      @post = notes.first

    # mulitple notes on that day with that slug, use the right nth one
    elsif notes.length > 1
      @post = Note.where(year:  params[:year]  || @post.year
                 ).where(month: params[:month] || @post.month
                 ).where(day:   params[:day]   || @post.day
                 ).where(slug:  params[:slug]  || @post.slug).load.first

    # no notes that match slug, go to /notes feed
    else notes.length.zero?
      return redirect_to notes_url
    end
  end

  def post_params
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
