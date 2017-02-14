class LinksController < ApplicationController

  def index
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      flash[:success] = "Updated!"
      redirect_to links_path
    else
      flash[:danger] = "Invalid Attributes"
      render :edit
    end
  end

  private

  def link_params
    params.require(:link).permit(:url, :title)
  end

end
