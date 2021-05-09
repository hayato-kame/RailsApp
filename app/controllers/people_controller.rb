class PeopleController < ApplicationController

  def index
    @msg = 'Person data'
    @data = Person.all
    @f_msg = params[:f_msg]
    pp @data
    # binding.pry
    render 'index'
  end

  def show
    @mdg = '検索結果'
    @data = Person.find(params[:id])
    pp @data
    # binding.pry
    render 'show'
  end

  def add
    @msg = 'add new data.'
    @person = Person.new
    render 'add'
  end

  # def create
  #   if request.post? then
  #     obj = Person.create([
  #       {name: params['name'], age: params['age'], mail: params['mail'] }
  #     ])
  #   end
  #   redirect_to '/people?f_msg=成功'
  #   # redirect_to controller: 'people', action: 'index', params: {f_msg: '作成成功しました'}
  # end

  def create
    if request.post? then
      Person.create(person_params)
    end
    # redirect_to '/people?f_msg=登録できたよ〜〜〜〜〜'
    redirect_to controller: 'people', action: 'index', params: {f_msg: '登録成功！！！'}
  end

  private
  def person_params
    params.require(:person).permit(:name, :age, :mail)
  end

end
