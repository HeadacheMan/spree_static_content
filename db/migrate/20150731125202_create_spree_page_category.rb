class CreateSpreePageCategory < ActiveRecord::Migration
  def change
    create_table :spree_page_categories do |t|
      t.string :name
      t.text :description
      t.boolean :visible, default: true, null: false
    end
  end
end
