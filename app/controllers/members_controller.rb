class MembersController < ApplicationController
  def index
    @members = Member.all
  end
  
  def show
    @member = Member.find(params[:id])
    @customers = @member.customers
  end

  def edit
    @member = Member.find(params[:id])
  end
  
  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to member_path(@member.id)
  end
  
  private

  def member_params
    params.require(:member).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :email, :profile_image)
  end

  
end
