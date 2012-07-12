class Admin::HomeController < ApplicationController
    layout 'admin' 
  
  def index
    @users = User.all
 

  end
end
