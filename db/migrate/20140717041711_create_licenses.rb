class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses do |t|
      t.string :name
      t.string :short_code
      t.text :description
      t.text :url

      t.timestamps
    end
  end
end
