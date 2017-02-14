class Api::V1::LinksController < ApplicationController

  def create
    @link = Link.create(url: params["url"], title: params["title"], user_id: params["userid"].to_i)
  end

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(read: true)
      render json: @link
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

end
