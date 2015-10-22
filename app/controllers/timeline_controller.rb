class TimelineController < ApplicationController
    def index
        @blogs = Blog.all.reverse
    end
    
    def write
        Blog.create(content: params[:name])
        redirect_to :root
    end
    
    def comment
        Comment.create(blog_id: params[:blog_id], msg: params[:comment])
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
end
