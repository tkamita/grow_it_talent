class Public::AppliesController < ApplicationController

  def index
    @corporation = current_corporation
  end
end
