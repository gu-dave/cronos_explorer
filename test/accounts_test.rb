require_relative './test_helper'

class ScannersTest < Minitest::Test
  def setup
    CronosExplorer.net = 'testnet3'
    @vvs_contractaddress = '0x904bd5a5aac0b9d88a0d47864724218986ad4a3a'
    @tusd_contractaddress = '0x41315E63d0663Ce839931fed7451084613E385b3'
    @address = '0x0eE92A5c08480A966B2B503821c49F936686E440'
    @blockno = 2665573
    @timestamp = 1648184128
    @timestamp2 = 1748184128
    
    sleep 0.5
  end

  def test_eth_get_balance
    res_doc = CronosExplorer::Accounts.eth_get_balance(@address)

    # puts res_doc
    assert_equal res_doc['id'], 0
    # assert_equal res_doc['result'].hex, 28775150000000000000
  end

  def test_balance
    res_doc = CronosExplorer::Accounts.balance(@address)

    # puts res_doc

    assert_equal res_doc['message'], 'OK'
    # assert_equal res_doc['result'], '28775150000000000000'
  end

  def test_txlist
    res_doc = CronosExplorer::Accounts.txlist(@address, @timestamp)
    # puts res_doc

    assert_equal res_doc['message'], 'OK'
    assert_equal res_doc['status'], '1'


    res_doc = CronosExplorer::Accounts.txlist(@address, @timestamp2)
    # puts res_doc

    assert_equal res_doc['message'], 'No transactions found'
    assert_equal res_doc['status'], '0'
  end

  def test_tokenbalance
    res_doc = CronosExplorer::Accounts.tokenbalance(@vvs_contractaddress, @address)
    # puts res_doc

    assert_equal res_doc['message'], 'OK'
    # assert_equal res_doc['result'], '934302507446856929956626'


    res_doc = CronosExplorer::Accounts.tokenbalance(@tusd_contractaddress, @address)
    # puts res_doc

    assert_equal res_doc['message'], 'OK'
    # assert_equal res_doc['result'], '99997450000000000000000'
  end

  def test_tokenlist
    res_doc = CronosExplorer::Accounts.tokenlist(@address)

    # puts res_doc

    assert_equal res_doc['message'], 'OK'
    assert_equal res_doc['status'], '1'
  end

  def test_tokentx
    res_doc = CronosExplorer::Accounts.tokentx(@address, @blockno)

    # puts res_doc

    assert_equal res_doc['message'], 'OK'
    assert_equal res_doc['status'], '1'
  end
end
