class FinancialOperationsController < ApplicationController

  def index
    render :index
  end

  def create
    @response = ImportService.call params[:arquivo]

    unless @response
    flash[:notice] = 'Extensão inválida'
      render :index
    else
      flash[:notice] = 'Dados importados com sucesso'
      @financial_operations = FinancialOperation.all.order(store_name: :asc, type: :asc)
      render :show
    end
  end
end
