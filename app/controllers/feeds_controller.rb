class FeedsController < ApplicationController
  before_action :set_feed, only: [:show, :edit, :update, :destroy]

  def index
    @feeds = Feed.all.order(id: "DESC")
  end

  def new
    # confirm.html.erbから戻るを押した時にbackが属性として付いてくる
    # 確認画面から戻った時の処理
    if params[:back]
      # 戻った際に送られたパラメーターをセットして新規画面を作成
      @feed = Feed.new(feed_params)
    else
      @feed = Feed.new
    end
  end

  def confirm
    @feed = current_user.feeds.build(feed_params)
    render :new if @feed.invalid?
  end

  def edit
  end

  def create
    @feed = current_user.feeds.build(feed_params)
    respond_to do |format|
      if @feed.save
        format.html { redirect_to feeds_path, notice: '投稿しました' }
        format.json { render :show, status: :created, location: @feed }
      else
        format.html { render :new }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @feed.update(feed_params)
        format.html { redirect_to user_path(current_user.id), notice: '編集しました' }
        format.json { render :show, status: :ok, location: @feed }
      else
        format.html { render :edit }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @feed.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user.id), notice: '削除しました' }
      format.json { head :no_content }
    end
  end

  private
  # idをもとにデータベースから該当するデータを取得する処理を記述
  def set_feed
    @feed = Feed.find(params[:id])
  end

  def feed_params
    params.require(:feed).permit(:image, :text, :image_cache, :id)
  end
end
