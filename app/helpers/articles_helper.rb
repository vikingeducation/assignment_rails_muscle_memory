module ArticlesHelper
  def article_parameters
    params.require(:article).permit(:title, :body)
  end
end
