require_relative './test_helper'

class ScannersTest < Minitest::Test
  def setup
    CronosExplorer.net = 'testnet3'
    @vvs_contractaddress = '0x904bd5a5aac0b9d88a0d47864724218986ad4a3a'
    @address = '0x0eE92A5c08480A966B2B503821c49F936686E440'

    sleep 0.5
  end

  def test_getToken
    res_doc = CronosExplorer::Tokens.getToken(@vvs_contractaddress)

    # puts res_doc

    assert_equal res_doc['message'], 'OK'
    assert_equal res_doc['result']['contractAddress'], @vvs_contractaddress
    assert_equal res_doc['result']['symbol'], 'VVS'
    assert_equal res_doc['result']['totalSupply'], "40697764367875192854888533822079"
  end

  def test_getTokenHolders
    res_doc = CronosExplorer::Tokens.getTokenHolders(@vvs_contractaddress)

    # puts res_doc

    assert_equal res_doc['message'], 'OK'
  end

end
