class CreateTweeets < ActiveRecord::Migration
  def change
    create_table :tweeets do |t|
      t.text :content

      t.timestamps null: false
    end
  end
end
