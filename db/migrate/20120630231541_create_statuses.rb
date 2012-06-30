class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.text    :content
      t.text    :in_reply_to
      t.boolean :private

      t.timestamps
    end
  end
end
