# frozen_string_literal: true

class HomeController < ApplicationController
  def show
    @signed_in = current_user.present?
  end
end
