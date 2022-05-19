require 'test_helper'

class FinancialOperationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @financial_operation = financial_operations(:one)
  end

  test "should get index" do
    get financial_operations_url
    assert_response :success
  end

  test "should get new" do
    get new_financial_operation_url
    assert_response :success
  end

  test "should create financial_operation" do
    assert_difference('FinancialOperation.count') do
      post financial_operations_url, params: { financial_operation: { card: @financial_operation.card, cpf: @financial_operation.cpf, date: @financial_operation.date, ocurrence_time: @financial_operation.ocurrence_time, store_name: @financial_operation.store_name, store_owner: @financial_operation.store_owner, type: @financial_operation.type, value: @financial_operation.value } }
    end

    assert_redirected_to financial_operation_url(FinancialOperation.last)
  end

  test "should show financial_operation" do
    get financial_operation_url(@financial_operation)
    assert_response :success
  end

  test "should get edit" do
    get edit_financial_operation_url(@financial_operation)
    assert_response :success
  end

  test "should update financial_operation" do
    patch financial_operation_url(@financial_operation), params: { financial_operation: { card: @financial_operation.card, cpf: @financial_operation.cpf, date: @financial_operation.date, ocurrence_time: @financial_operation.ocurrence_time, store_name: @financial_operation.store_name, store_owner: @financial_operation.store_owner, type: @financial_operation.type, value: @financial_operation.value } }
    assert_redirected_to financial_operation_url(@financial_operation)
  end

  test "should destroy financial_operation" do
    assert_difference('FinancialOperation.count', -1) do
      delete financial_operation_url(@financial_operation)
    end

    assert_redirected_to financial_operations_url
  end
end
