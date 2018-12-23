class SessionsController < ApplicationController
  def create
        member = Member.authenticate(params[:user_id], params[:password])
	if member
	  session[:member_id] = member.id
	else
	  flash.alert = "名前とパスワードが一致しません"
	end
	redirect_to :root
  end

  def destroy
	session.delete(:member_id)
	redirect_to :root
  end
end
