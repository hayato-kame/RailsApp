class MessagesController < ApplicationController
  layout 'messages'

  def index
    @msg = '一覧'
    @f_msg = params[:f_msg]
    @data = Message.all
    render 'index'
  end

  def show
    @msg = '詳細'
    @message = Message.find(params[:id])
    render 'show'
  end

  def add
    @msg = '新規作成'
    @message = Message.new
  end

  def create
    @message = Message.new (message_params)
    if @message.save then
      # redirect_to '/messages'
      # redirect_to '/messages?f_msg=新規作成できた'
      redirect_to( action: 'index', params: {'f_msg': '新規登録成功〜〜〜'})
    else
      render 'add'
    end
  end

  def edit
    @msg = 'ID: ' + params[:id] + ' の編集画面'
    @message = Message.find(params[:id])
    render 'edit'
  end

  def update
    obj = Message.find(params[:id])
    obj.update(message_params)
    # redirect_to '/messages?f_msg=データの更新成功です'
    # redirect_to controller: 'messages', action: 'index', params: {f_msg: '成功しました'}
    redirect_to( controller: 'messages', action: 'index', params: {'f_msg': '成功しました'})
  end

  def delete
    obj = Message.find(params[:id])
    obj.destroy
    # redirect_to '/messages'
    redirect_to '/messages?f_msg=削除しました！！！'
    # redirect_to( controller: 'messages', action: 'index', params: {'f_msg': '削除しました。'})
  end

  private
  def message_params
    params.require(:message).permit(:person_id, :title, :message)
  end

end
