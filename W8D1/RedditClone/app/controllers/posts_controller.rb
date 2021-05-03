class PostsController < ApplicationController

    def new
        @post = Post.new
        render :new
    end

    def create
        post = Post.new(post_params)
        post.sub_id = params[:sub_id]
        post.author_id = params[:author_id]
        if post.save
        else
            flash[:errors] = post.errors.full_messages
        end
        redirect_to sub_url(params[:sub_id])
    end

    def show
        @post = Post.find(params[:id])
        render :show
    end

    def edit
        @post = Post.find(params[:id])
        if @post.author_id == current_user.id #current_user.post.find_by
            render :edit
        else
            redirect_to subs_url
        end
    end

    def update
        post = Post.find_by(id: params[:id])

        if post.author_id == current_user.id
            if post.update(post_params)
                redirect_to sub_url(params[:sub_id])
            else
                flash[:errors] = post.errors.full_messages
                render :edit
            end 
        else
            redirect_to subs_url
        end
    end

    def destroy
        post = Post.find_by(id: params[:id])
        post.destroy
        redirect_to subs_url
    end

    def post_params
        params.require(:post).permit(:title, :url, :content)
    end

end
