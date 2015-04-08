class CreateDataas < ActiveRecord::Migration
  def change
    create_table :dataas do |t|

      t.timestamps null: false

      t.integer		:parent_id
      t.belongs_to	:thing

      t.string		:value

    end
  end
end
