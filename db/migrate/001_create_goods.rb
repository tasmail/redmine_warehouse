class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.column :project_id, :integer, :default => 0, :null => false
      t.column :title, :string, :default => "", :null => false
      t.column :price, :decimal, :precision => 10, :scale => 2
      t.column :quantity, :integer, :default => 0, :null => false
      t.column :manufacture, :datetime
      t.column :issue_id, :integer
      t.column :created_on, :timestamp
      t.column :updated_on, :timestamp
    end
  end
end
