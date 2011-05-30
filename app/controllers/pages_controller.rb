class PagesController < ApplicationController

  # This action is usually accessed with the root path, normally '/'
  def home
    @news_items = NewsItem.published.translated.limit(3)
    @index_infos = BlogCategory.find_by_title("destaques").posts.limit(3)
    @tips = BlogCategory.find_by_title("dicas").posts.limit(5)
    @random = BlogCategory.find_by_title("seguros").posts
    @random = @random[rand(@random.count)]
    error_404 unless (@page = Page.where(:link_url => '/').first).present?
  end
  
  def tips
    @tips = BlogCategory.find_by_title("dicas").posts
  end

  # This action can be accessed normally, or as nested pages.
  # Assuming a page named "mission" that is a child of "about",
  # you can access the pages with the following URLs:
  #
  #   GET /pages/about
  #   GET /about
  #
  #   GET /pages/mission
  #   GET /about/mission
  #
  def show
    @page = Page.find("#{params[:path]}/#{params[:id]}".split('/').last)

    if @page.try(:live?) || (refinery_user? && current_user.authorized_plugins.include?("refinery_pages"))
      # if the admin wants this to be a "placeholder" page which goes to its first child, go to that instead.
      if @page.skip_to_first_child && (first_live_child = @page.children.order('lft ASC').where(:draft=>false).first).present?
        redirect_to first_live_child.url
      elsif @page.link_url.present?
        redirect_to @page.link_url and return
      end
    else
      error_404
    end
  end

end
