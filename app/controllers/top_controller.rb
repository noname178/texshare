class TopController < ApplicationController
  protect_from_forgery except: [:create, :exist_user]
  include AguCheckable

  def index
  end

  def create
    if User.exists?(student_num: params[:stu_num])
      @user = User.find_by(student_num: params[:stu_num])
      warden.set_user @user
    else
      if agu_authenticate?(params[:stu_num], params[:password])
        @user = User.create(student_num: params[:stu_num],
                            email: "#{params[:stu_num]}@aoyama.jp",
                            password: params[:password],
                            password_confirmation: params[:password]
                            )
        warden.set_user @user
      else
        render :index
      end
    end
  end

  def exist_user
    @user = User.find_by(student_num: params[:stu_num])
    warden.set_user @user
    redirect_to search_index_path
  end
end