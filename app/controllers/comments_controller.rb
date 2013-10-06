class CommentsController < ApplicationController
	http_basic_authenticate_with name: Settings.admin_login,
		password: Settings.admin_password, except: [:index, :show]

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
		redirect_to post_path(@post)
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end

	private
		def comment_params
			params.require(:comment).permit(:commenter, :body)
		end
end
