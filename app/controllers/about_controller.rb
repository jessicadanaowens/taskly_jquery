class AboutController < ApplicationController
  skip_before_action :ensure_current_user
  def each_index
    @about = about
  end

end