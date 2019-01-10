class Admin::MembersController < Admin::Base

  def index
    @members = Member.order("id").paginate(page: params[:page], per_page: 5)
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params2)
    #@member.assign_attributes(member_params)
    puts "!!!!!!!!!!!!!admin/members/create"
	puts @member.is_admin
    if @member.save
      redirect_to [:admin, @member], notice: "会員登録が完了しました"
    else
      render "new"
    end
  end

  # 更新フォーム
  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    @member.assign_attributes(member_params2)
    if @member.save
      redirect_to [:admin, @member], notice: "会員情報を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @rentals = Rental.order("id").where(member_id: @member.id).where(return_date: nil)
    if @rentals.empty?   
      @member.destroy
      redirect_to :admin_members, notice: "会員を削除しました。"
    else
      redirect_to :admin_members, notice: "会員削除に失敗しました。貸出処理が終了していません。"
    end
  end

  def search
    @members = Member.search(params[:q])
    render "index"
  end

  #管理者によるアカウント追加用
  private
  def member_params2
    attrs = [:user_id, :name, :place, :tel, :mail_address,:defpassword, :password_confirmation, :is_admin]
    params.require(:member).permit(attrs)
  end
  #管理者による会員のプロフィール情報編集用
  private
  def member_params
    attrs = [:user_id, :name, :place, :tel, :mail_address,:defpassword, :password_confirmation]
    params.require(:member).permit(attrs)
  end

end
