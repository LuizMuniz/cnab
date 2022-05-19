require "application_system_test_case"

class FinancialOperationsTest < ApplicationSystemTestCase
  setup do
    @financial_operation = financial_operations(:one)
  end

  test "visiting the index" do
    visit financial_operations_url
    assert_selector "h1", text: "Financial Operations"
  end

  test "creating a Financial operation" do
    visit financial_operations_url
    click_on "New Financial Operation"

    fill_in "Card", with: @financial_operation.card
    fill_in "Cpf", with: @financial_operation.cpf
    fill_in "Date", with: @financial_operation.date
    fill_in "Ocurrence time", with: @financial_operation.ocurrence_time
    fill_in "Store name", with: @financial_operation.store_name
    fill_in "Store owner", with: @financial_operation.store_owner
    fill_in "Type", with: @financial_operation.type
    fill_in "Value", with: @financial_operation.value
    click_on "Create Financial operation"

    assert_text "Financial operation was successfully created"
    click_on "Back"
  end

  test "updating a Financial operation" do
    visit financial_operations_url
    click_on "Edit", match: :first

    fill_in "Card", with: @financial_operation.card
    fill_in "Cpf", with: @financial_operation.cpf
    fill_in "Date", with: @financial_operation.date
    fill_in "Ocurrence time", with: @financial_operation.ocurrence_time
    fill_in "Store name", with: @financial_operation.store_name
    fill_in "Store owner", with: @financial_operation.store_owner
    fill_in "Type", with: @financial_operation.type
    fill_in "Value", with: @financial_operation.value
    click_on "Update Financial operation"

    assert_text "Financial operation was successfully updated"
    click_on "Back"
  end

  test "destroying a Financial operation" do
    visit financial_operations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Financial operation was successfully destroyed"
  end
end
