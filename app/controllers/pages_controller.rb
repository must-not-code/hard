class PagesController < ApplicationController
  def about
    @page = Page.find_by_title('about')
  end
end
