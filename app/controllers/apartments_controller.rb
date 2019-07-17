# frozen_string_literal: true

class ApartmentsController < ApplicationController
  def index
    @apartments = ApartmentsService.load_feed
  end
end
