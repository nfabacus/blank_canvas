class CreateCanvas < ActiveRecord::Migration
  def change
    create_table :canvas do |t|

      t.timestamps null: false
    end
  end
end
