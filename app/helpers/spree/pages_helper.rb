module Spree
  module PagesHelper
    def render_snippet(slug)
      page = Spree::Page.find_by_slug(slug)
      raw page.body if page
    end


    # Render a list of pages from the specified
    # category using default bootstrap3 elements
    # @param slug [Spree::PageCategory] Slug from a PageCategory resource
    def render_pages_menu_for(slug)
      category = Spree::PageCategory.find_by slug: slug.to_s
      if category && category.pages.count > 0
        list = content_tag :ul, {class: 'page-menu'} do
          category.pages.each do |page|
            list_item = content_tag :li, {class: 'page-menu-item'} do
              link_to page.link, page.link
            end
            concat(list_item).html_safe
          end
        end
        list
      end
    end

  end
end
