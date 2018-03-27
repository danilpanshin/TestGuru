class BadgesController < ApplicationController

   def index
    
    @alls = Badge.all

    @badges = current_user.badges
  end

end