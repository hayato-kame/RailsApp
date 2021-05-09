class PeopleController < ApplicationController

  def index
    @msg = 'Person data'
    @data = Person.all
    pp @data
    # binding.pry
    render 'index'
  end
end
