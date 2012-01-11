class CreatePassions < ActiveRecord::Migration
  def self.up
    create_table :passions do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :passions
  end
end
