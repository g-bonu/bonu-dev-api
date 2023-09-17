class CreateProjectImages < ActiveRecord::Migration[7.0]
  def change
    create_table :project_images do |t|
      t.belongs_to :project, null: false, foreign_key: true
      t.string :image_url, null: false
      t.string :public_id, null: false
      t.string :thumbnail_url, null: false
      
      t.timestamps
    end
  end
end
