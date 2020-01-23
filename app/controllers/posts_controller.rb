class PostsController < ApplicationController
    def index
        #This will be the main page
        @posts = Post.all
    end

    def show
        #when we redirect to @post this is to be shown
        @post = Post.find(params[:id])
    end    

    def new
        #For calling @post in new
        @post =Post.new
    end
    
    def create
        #render plain: params[:post].inspect
        #on clicking on submit in new.html.erb
        @post=Post.new(post_params)

        if (@post.save())
        redirect_to @post
        else 
            render 'new'
        end
    end

    def post_params
        #For create
        params.require(:post).permit(:title, :body)
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update 
        #after edit and save post click on edit this will be rendered
        @post = Post.find(params[:id])

        if (@post.update(post_params))
            redirect_to @post
            else 
                render 'edit'
            end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy

        redirect_to posts_path
    end
end
