class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(funastar_id: params[:funastar_id])
    redirect_to funastars_url, notice: "#{favorite.funastar.user.name}さんのブログをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to funastars_url, notice: "#{favorite.funastar.user.name}さんのブログをお気に入り解除しました"
  end
end
