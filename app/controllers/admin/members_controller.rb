class Admin::MembersController < Admin::Base

  def index
    @members = Member.order("id")
  end

  def show
    @member = Member.find(params[:id])
    if params[:format].in?(["jpg", "png", "gif"])
      send_image
    else
      render "show"
    end
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    #@member.assign_attributes(member_params)
    if @member.save
      redirect_to controller: [:admin, @member], notice: "会員登録が完了しました"
    else
      render "edit"
    end
  end

  # 更新フォーム
  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    @member.assign_attributes(member_params)
    if @member.save
      redirect_to [:admin, @member], notice: "会員情報を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to :admin_members, notice: "会員を削除しました。"
  end

  def search
    @members = Member.search(params[:q])
    render "index"
  end

  private
  def member_params
    attrs = [:user_id, :name, :place, :tel, :mail_address,:defpassword, :password_confirmation, :is_admin]
    params.require(:member).permit(attrs)
  end

end
