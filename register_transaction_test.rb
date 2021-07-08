require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @reg = CashRegister.new(0)
    @tran = Transaction.new(4)
    @tran.amount_paid = 5
  end

  def test_accepts_money
    assert_equal(0, @reg.total_money)
    @reg.accept_money(@tran)
    assert_equal(5, @reg.total_money)
  end

  def test_change
    assert_equal 1, @reg.change(@tran)
  end

  # def test_give_receipt
  #   assert_nil @reg.give_receipt(@tran)
  #   assert_output(stdout = "You've paid $4.\n") do
  #     @reg.give_receipt(@tran)
  #   end
  # end

  def test_prompt_for_payment
    input = StringIO.new("4\n")
    output = StringIO.new
    @tran.prompt_for_payment(input: input, output: output)
    assert_equal 4, @tran.amount_paid
  end
end
