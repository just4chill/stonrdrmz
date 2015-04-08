class HomeController < ApplicationController

  def index
    @posts = getAll()
  end

  def about
  	
  end

  def contact
  	
  end

  def help
  	
  end

    private

  def getAll
    @resp ||= Array.new
    @dats     = Thing.find_by!(name: "post_url").dataas.all()

    @dats.each do |dat|
      oHash = {        
        :id => dat.id,
        :title => Thing.find_by!(name: "post_title").dataas.find_by!(parent_id: dat.id).value,
        :img => Thing.find_by!(name: "post_img").dataas.find_by!(parent_id: dat.id).value}
      @resp.push(oHash)
    end

    ap @resp
    return @resp
  end

end
