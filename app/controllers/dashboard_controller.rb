class DashboardController < ApplicationController

  def index
    @recipient = current_user.recipient
    @wish = @recipient&.wish_to_display
  end
end
