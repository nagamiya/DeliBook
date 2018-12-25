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
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    puts @member.name + "," + @member.password
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"

    if @member.save
      redirect_to :account, notice: "プロフィールを更新しました。"
    else
      render "edit"
    end
  end

  private
  def account_params
    attrs = [:user_id, :name, :place, :tel, :mail_address, :defpassword, :password_confirmation]
    params.require(:account).permit(attrs)
  end
end

#$2a$10$W9OBP/VsrSzT8QuBoC2N8.Dv5Lv9shRU9OQz7UIpKY/Ldbc2jaycu

