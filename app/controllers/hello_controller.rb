# coding: utf-8

class HelloController < ApplicationController
  def index
    render :text => 'こんにちは、下界！'
  end
  def view
    @msg = 'こんにちは、世界！こちらはビューです！'
  end
  def view2
    @msg = 'view2'
  end
  def list
    @books = Book.all
  end
end

