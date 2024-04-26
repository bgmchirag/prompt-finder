class ApplicationController < ActionController::Base
  helper_method :current_page

  def current_page
    @current_page ||= params[:page].to_i.nonzero? || 1
  end
end
