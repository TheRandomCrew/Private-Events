# frozen_string_literal: true

class HomeController < ApplicationController
  skip_before_action :auth_user?
  def show
    @current_user = current_user
  end
end
