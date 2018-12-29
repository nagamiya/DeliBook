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

  def destroy
	puts "destroy!!!!!!!!!!!!!!!!!!!"
    @member = current_member
    @member.destroy
    redirect_to root_path, notice: "退会しました。"    
  end

  private
  def account_params
    attrs = [:user_id, :name, :place, :tel, :mail_address, :defpassword, :password_confirmation]
    params.require(:account).permit(attrs)
  end
end


