class PeopleController < ApplicationController
  # layout 'people'

  def index
    @msg = 'Person data'
    @data = Person.all
    @f_msg = params[:f_msg]
    pp @data
    # binding.pry
    render 'index'
  end

  # def find
  #   @msg = '検索画面'
  #   # 配列オブジェクトです GETアクセスなら、空の配列をリターン
  #   @people = Array.new
  #   @f_msg = params[:f_msg]

  #   if request.post? then
  #     obj = Person.find params['find']
  #     @people.push obj
  #     # render 'find', params: {f_msg: '検索結果です'} and return
  #     render 'find' and return
  #   end
  #   # render 'find', params: {f_msg: '検索をします'}
  #   render 'find'
  # end

  # def find
  #   @msg = '検索'
  #   @people = Array.new
  #   if request.post? then
  #     # 完全一致
  #     @people = Person.where name: params[:find]
  #   end
  # end

  # def find
  #   @msg = '式を用いた検索'
  #   @people = Array.new
  #   if request.post? then
  #     # 第一引数に条件式とプレースホルダー 第二引数にプレースホルダーに当てはめる値　括弧は省略できる
  #     @people = Person.where("age >= ?", params[:find])
  #     pp @people
  #   end
  #   render 'find'
  # end

  # def find
  #   @msg = 'LIKE演算式'
  #   @people = Array.new
  #   if request.post? then
  #     @people = Person.where "mail like ?", '%' + params[:find] + '%'
  #   end
  #   render 'find'
  # end

  # def find
  #   @msg = '複数条件検索'
  #   @people = Array.new
  #   if request.post? then
  #     f = params[:find].split ','
  #     @people = Person.where("age >= ? and age <= ?", f[0], f[1])
  #   end
  #   render 'find'
  # end

  # def find
  #   @msg = 'OR演算子について'
  #   @people = Array.new
  #   if request.post? then
  #     f = '%' + params[:find] + '%'
  #     @people = Person.where( "name like ? or mail like ?", f, f)
  #   end
  #   render 'find'
  # end

  # def find
  #   @msg = '検索結果'
  #   @people = Array.new
  #   if request.post? then
  #     f = '%' + params[:find] + '%'
  #     result = Person.where "name like ? or mail like ? ", f, f
  #     @people.push result.first
  #     @people.push result.last
  #   end
  #   render 'find'
  # end

  #  def find
  #    @msg = '複数選択できるfindメソッドです'
  #    @people = Array.new
  #    if request.post? then
  #     f = params[:find].split ','
  #     @people = Person.find(f)
  #     pp @people
  #    end
  #    render 'find'
  #  end

  # def find
  #   @msg = '検索結果'
  #   @people = Array.new
  #   if request.post? then
  #     f = params[:find].split ','
  #     @people = Person.where('name like ?', '%' + params[:find] + '%').order 'age asc'
  #   end
  # end

  def find
    @msg = '検索'
    if request.post? then
      f = params[:find].split ','
      @people = Person.all.limit(f[0]).offset(f[1])
    else
      @people = Person.all
    end
  end


  def show
    @msg = '詳細'
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

  # def create
  #   if request.post? then
  #     Person.create(person_params)
  #   end
  #   # redirect_to '/people?f_msg=登録できたよ〜〜〜〜〜'
  #   redirect_to controller: 'people', action: 'index', params: {f_msg: '登録成功！！！'}
  # end


  # バリデーションチェックする

  # def create
  #   @person = Person.new person_params
  #   if @person.save then
  #     # redirect_to '/people?f_msg=登録成功しました！！'
  #     redirect_to controller: 'people', action: 'index', params: {'f_msg': '成功だ！！'}
  #   else
  #     @msg = '問題があります'
  #     @f_msg = '失敗しました'
  #     # renderは、インスタンス変数は何もしなくてもテンプレートに渡せます
  #     render 'add'
  #   end
  # end

  def create
    @person = Person.new person_params
    if @person.save then
      # redirect_to '/people?f_msg=保存に成功しました！！'
      redirect_to controller: 'people', action: 'index', params: {'f_msg': '成功ですね！'}
    else
      @f_msg = '保存に失敗しました、修正してください！！'
      render 'add'
    end
  end

  def edit
    @msg = 'id: ' + params[:id] + ' のデータを編集します'
    @person = Person.find(params[:id])
    render 'edit'
  end

  def update
    @update_person = Person.find(params[:id])
    @update_person.update(person_params)
    redirect_to '/people?f_msg=更新に成功しました'
    # redirect_to controller: 'people' , action: 'index', params: {f_msg: '更新しました！！！'}
  end

  def delete
    @delete_person = Person.find(params[:id])
    @delete_person.destroy
    # redirect_to '/people?f_msg=削除しました'
    redirect_to controller: 'people', action: 'index', params: {'f_msg': '削除しましたyo！！！'}

  end

  private
  def person_params
    params.require(:person).permit(:name, :age, :mail)
  end

end
