class Public::AppliesController < ApplicationController
  before_action :authenticate_corporation!

  def index
    @corporation = current_corporation
  end
end
