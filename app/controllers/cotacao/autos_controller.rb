# encoding: utf-8
class Cotacao::AutosController < ApplicationController
  def index
    @orcamento = Orcamento.new
  end
  
  def create
    @orcamento = Orcamento.new(params[:orcamento][:nome])
    if @orcamento.valid?
      flash[:notice] = "Orçamento enviado"
      render :action => "index"
    else
      render :action => "index"
    end
  end
end