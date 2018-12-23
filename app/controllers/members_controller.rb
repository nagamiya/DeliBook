class MembersController < ApplicationController
  before_action :login_required

  def index
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
  end

  #def edit
  #  @member = Member.find(params[:id])
  #end

  def create
  end

  #def update
  #  @member = Member.find(params[:id])
  #  @member.assign_attributes(member_params)
  #  if @member.save
  #    redirect_to :action => "show", notice: "会員情報を更新しました。"
  #  else
  #    render "edit"
  #  end
  #end

  def destroy
  end

  def search
  end

  #private
  #def member_params
  #  attrs = [:user_id, :name, :place, :tel, :mail_address]
  #  params.require(:member).permit(attrs)
  #end

end
