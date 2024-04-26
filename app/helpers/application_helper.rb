module ApplicationHelper
  def paginate(current_page, total_pages)
    items = []

    items << paginate_previous_link(current_page) if current_page > 1

    page_range(current_page, total_pages).each do |page|
      items << paginate_page_link(page, current_page)
    end

    items << paginate_next_link(current_page) if current_page < total_pages

    items.join.html_safe
  end

  private

  def paginate_previous_link(current_page)
    paginate_item(t('pagination.links.previous'), datasets_path(query_params(current_page - 1)), class: "page-link")
  end

  def page_range(current_page, total_pages)
    [(current_page - PAGINATION_RANGE), 1].max..[(current_page + PAGINATION_RANGE), total_pages].min
  end

  def paginate_page_link(page, current_page)
    paginate_item(page, datasets_path(query_params(page)),
                  { class: "page-link #{page == current_page ? 'active' : ''}" })
  end

  def paginate_item(label, path, options = {})
    content_tag(:li) do
      link_to(label, path, options)
    end
  end

  def paginate_next_link(current_page)
    paginate_item(t('pagination.links.next'), datasets_path(query_params(current_page + 1)), class: "page-link")
  end

  def query_params(page)
    { page:, prompt: params[:prompt] }.compact
  end
end
