class FinancialOperationsController < ApplicationController
  # before_action :set_financial_operation, only: %i[ show edit update destroy ]

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
      @pessoas = FinancialOperation.all
      render :show
    end
  end
end
