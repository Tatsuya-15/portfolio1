class FavoritesController < ApplicationController

  def create
    if current_member.id != params[:member_id].to_i
      return
    end
    favorite = current_member.favorites.new(member_id: current_member.id, customer_id: params[:customer_id])
    favorite.save!
    member = Member.find(params[:member_id])
    redirect_to member_path(member)
  end

  def destroy
    if current_member.id != params[:member_id].to_i
      return
    end
    member = Member.find(params[:member_id])
    favorite = current_member.favorites.find_by(customer_id: params[:customer_id])
    favorite.destroy
    redirect_to member_path(member)
  end

end
