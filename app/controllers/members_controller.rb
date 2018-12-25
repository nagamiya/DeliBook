class MembersController < ApplicationController
  before_action :login_required
  skip_before_action :login_required, only: [:new,:create]
  def index
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new
  end

  #def edit
  #  @member = Member.find(params[:id])
  #end

  def create
    @member = Member.new(member_params)
    #@member.assign_attributes(member_params)
    if @member.save
      redirect_to controller: "top", action: "index", notice: "会員登録が完了しました"
    else
      render "edit"
    end
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

  private
  def member_params
    attrs = [:user_id, :name, :place, :tel, :mail_address,:defpassword, :password_confirmation]
    params.require(:member).permit(attrs)
  end

end
