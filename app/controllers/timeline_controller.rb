class TimelineController < ApplicationController
    before_action :authenticate_user!, except: :index
    def index
        @blogs = Blog.all.reverse
        # @myblogs = Blog.where(user_id: current_user.id)
    end
    
    def write
        Blog.create(user_id: current_user.id, content: params[:name])
        redirect_to :root
    end
    
    def comment
        Comment.create(user_id: current_user.id, blog_id: params[:blog_id], msg: params[:comment])
        redirect_to :root
    end
    
    def delete
        a=Comment.find(params[:comment_id])
        a.destroy
        redirect_to :root
    end
    
    def modify
        b=Comment.find(params[:comment_id])
        b.msg=params[:comment2]
        b.save
        redirect_to :root
    end
    
    def individual
        @blogs = Blog.where(user_id: params[:user_id]).reverse
    end
end
