class MakeToAnArray < ActiveRecord::Migration
  def change
    remove_column :messages, :to, :string
    add_column :messages, :to, :string, array: true, default: []
  end
end
