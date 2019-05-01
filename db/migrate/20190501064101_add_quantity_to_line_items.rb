class AddQuantityToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :quantity, :interger, :default => 1
    #:limit => 50, :null => false, :default => 1 cac tham  so khac co the dua vao
  end
end
