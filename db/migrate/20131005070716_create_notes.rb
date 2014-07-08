class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :content,
             :in_reply_to,
             :tags,
             :syndication,
             :location_name,
             :location_latitude,
             :location_longitude,
             :location_altitude,
             :slug,
             :source,
             :twitter_url

      t.string :year,
               :month,
               :day,
               :hour,
               :minute,
               :second

      t.boolean  :private
      t.datetime :published_at

      t.timestamps
    end
  end
end
