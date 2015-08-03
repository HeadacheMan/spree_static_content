class AddColumnSlugToSpreePageCategory < ActiveRecord::Migration
  def change
    add_column :spree_page_categories, :slug, :string
  end
end
