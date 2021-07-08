require 'minitest/autorun'
require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @t = File.open('sample.txt')
    @text = Text.new(@t.read)
  end

  def teardown
    @t.close
  end

  def test_swap
    expected = <<-MSG
Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
et verius meuris, et pheretre mi.
    MSG
    assert_equal(expected, @text.swap('a', 'e'))
  end

  def test_word_count
    assert_same(72, @text.word_count)
  end
end
