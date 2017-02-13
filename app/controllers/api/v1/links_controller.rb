class Api::V1::LinksController < ApplicationController

  def create
    @link = Link.create(url: params["url"], title: params["title"], user_id: params["userid"].to_i)
  end

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(link_params)
      render json: @link
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  private

  def link_params
    params.permit(:read)
  end
end
