require_relative './test_helper'

class ScannersTest < Minitest::Test
  def setup
    CronosExplorer.net = 'testnet3'
    sleep 0.5
  end

  def test_eth_block_number
    res_doc = CronosExplorer::Blocks.eth_block_number

    # puts res_doc

    assert_equal res_doc['id'], 1
    assert_gt res_doc['result'].hex, "0x2724fd".hex  
  end

  def test_getblockreward
    res_doc = CronosExplorer::Blocks.getblockreward(@blockno)

    # puts res_doc

    assert_equal res_doc['message'], 'OK'
    assert_equal res_doc['result']['blockMiner'], '0x67b43f72bc20e39736d03e01be3bd8ed7f993307'
    assert_equal res_doc['result']['blockReward'], '0'
  end
end
