class CreateShmarticles < ActiveRecord::Migration
  def change
    create_table :shmarticles do |t|
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
