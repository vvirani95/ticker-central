class CreateMovers < ActiveRecord::Migration[6.0]
  def change
    create_table :movers do |t|

      t.timestamps
    end
  end
end
