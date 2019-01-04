class SessionsController < ApplicationController
  def create
        member = Member.authenticate(params[:user_id], params[:password])
	if member
	  session[:member_id] = member.id
	  if member.is_admin?
	    redirect_to :admin_root
          else
	    redirect_to :root
	  end
	else
	  flash.alert = "名前とパスワードが一致しません"
	  redirect_to :root
	end

  end

  def destroy
	session.delete(:member_id)
	redirect_to :root
  end
end
