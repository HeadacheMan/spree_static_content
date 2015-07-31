RSpec.describe Spree::PagesHelper, type: :helper do
  context '.render_snippet' do
    it 'returns body when page exists' do
      page = create(:page)
      expect(render_snippet(page.slug)).to eq page.body
    end

    it 'returns nil when no page exist' do
      expect(render_snippet('hello')).to be_nil
    end
  end

  context '.render_pages_menu_for' do

    it 'renders a menu with links from a specified page category' do
      pg = create(:page_category, name: 'test')
      4.times {create(:page, page_category: pg)}
      expect(render_pages_menu_for(:test)).not_to be_nil
    end

    it 'renders nothing when the specified category has no posts or dont exist' do

    end

  end


end
