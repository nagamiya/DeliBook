class MembersController < ApplicationController
  before_action :login_required
  skip_before_action :login_required, only: [:new,:create]

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    #@member.assign_attributes(member_params)
    if @member.save
      flash[:notice] = "会員登録が完了しました"
      redirect_to controller: "top", action: "index"
    else
      render "new"
    end
  end

  private
  def member_params
    attrs = [:user_id, :name, :place, :tel, :mail_address, :password, :password_confirmation]
    params.require(:member).permit(attrs)
  end

end
