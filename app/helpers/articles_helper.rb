module ArticlesHelper

  def allowed_params
    params.require(:article).permit(:title, :body)
  end
end
