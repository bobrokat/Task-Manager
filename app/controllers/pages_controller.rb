class PagesController < ApplicationController
  def welcome
    @user_signed_in = user_signed_in?
  end
end
