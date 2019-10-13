# frozen_string_literal: true

class HomesController < ApplicationController
  def show
    @followings = User.find(current_user.id).following
  end
end
