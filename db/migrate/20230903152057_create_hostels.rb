class CreateHostels < ActiveRecord::Migration[7.0]
  def change
    create_table :hostels do |t|

      t.timestamps
    end
  end
end
