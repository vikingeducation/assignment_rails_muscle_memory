module ArticlesHelper

  def whitelisted_post_params
    params.permit(:title, :body)

    # params.require(:article).permit(:title, :body)
  end
end
