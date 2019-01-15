class AccountsController < ApplicationController
  before_action :login_required

  def show
    @member = current_member
  end

  def edit
   @member = current_member
  end

  def update
    @member = current_member
    @member.assign_attributes(account_params)
    if @member.save
      redirect_to action: "show", notice: "プロフィールを更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    puts "fooooooooooooooooo"
    @rentals = Rental.order("id").where(member_id: current_member.id).where(return_date: nil)
    if @rentals.empty?
	puts "aaaaaaaaa"
      @member = Member.find(current_member)
      @member.destroy
      redirect_to controller: "top", action: "index", notice: "退会しました。" 
    else
	puts "bbbbbbbbb"
      redirect_to action: "show", notice: "退会に失敗しました。貸出処理が終了していません。"
    end
  end

  private
  def account_params
    attrs = [:user_id, :name, :place, :tel, :mail_address, :password, :password_confirmation]
    params.require(:account).permit(attrs)
  end
end


