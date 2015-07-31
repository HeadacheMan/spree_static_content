class ExtendPagesWithCategories < ActiveRecord::Migration

  def self.up
    change_table :spree_pages do |t|
      t.integer :page_category_id
      t.remove :show_in_header
      t.remove :show_in_footer
      t.remove :show_in_sidebar
    end
    add_index :spree_pages, :page_category_id
  end

  def self.down
    change_table :spree_pages do |t|
      t.remove :page_category_id
      t.boolean :show_in_header, default: false, null: false
      t.boolean :show_in_footer, default: false, null: false
      t.boolean :show_in_sidebar, default: false, null: false
    end
    remove_index :spree_pages, :page_category_id
  end

end
