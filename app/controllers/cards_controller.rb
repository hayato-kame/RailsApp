class CardsController < ApplicationController
  layout 'cards'
  def index
    @cards = Card.all

    render 'index'
  end

  def show
    @card = Card.find(params[:id])
    render 'show'
  end

  def add
    if request.post? then
      Card.create(card_params)
      goback
    else
      @card = Card.new
      render 'add'
    end

  end

  def edit
    @card = Card.find(params[:id])
    if request.patch? then
      @card.update(card_params)
      goback
    else
      render 'edit'
    end
  end

  def delete
    Card.find(params[:id]).destroy
    goback
  end

  private
  def card_params
    params.require(:card).permit(:title, :author, :price, :publisher, :memo)
  end

  def goback
    redirect_to '/cards'
  end

end
