class Admin::AdminController < ApplicationController
  before_action :authenticate_user!

  def index
    render 'admin/index'
  end
end
