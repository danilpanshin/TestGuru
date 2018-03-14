class AddTimerToTest < ActiveRecord::Migration[5.1]
  
  def self.up 
    add_column :tests, :timer, :integer
  end

  def self.down
    remove_column :tests, :timer 
  end

end
