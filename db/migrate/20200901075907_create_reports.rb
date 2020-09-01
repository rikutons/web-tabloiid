class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.string :file_name
      t.string :file_path
      t.datetime :date
      t.string :password
      t.string :image_path

      t.timestamps
    end
  end
end
