class FavoritesController < ApplicationController

  def create
    member = Member.find(params[:member_id])
    favorite = current_member.favorites.new(member_id: member.id, customer_id: params[:customer_id])
    favorite.save!
    redirect_to member_path(member)
  end

  def destroy
    member = Member.find(params[:member_id])
    favorite = current_member.favorites.new(member_id: member.id)
    favorite.destroy
    redirect_to member_path(member)
  end

end
