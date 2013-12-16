class ChangePricePrecisions < ActiveRecord::Migration
  def up
    change_table :products do |t|
      t.change :price, :decimal, :precision => 8, :scale => 2
    end
    change_table :events do |t|
      t.change :price, :decimal, :precision => 8, :scale => 2
    end
  end
  def down
    change_table :products do |t|
      t.change :price, :decimal, :precision => 5, :scale => 2
    end
    change_table :events do |t|
      t.change :price, :decimal, :precision => 5, :scale => 2
    end
  end
end
