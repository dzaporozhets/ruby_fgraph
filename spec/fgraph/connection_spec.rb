# To change this template, choose Tools | Templates
# and open the template in the editor.
require 'spec_helper'

describe FGraph::Connection do
  before(:each) do
    @valid_params = {
      :app_id => '149291415089452',
      :app_secret => '4e13073ded8bfb0cc3279e86811121b0'
    }
    @valid_token = "149291415089452|0167f243d68e03b3d7ed89dc-1642845171|HIVODHHm-i9Ho3ccAr7yzucn8hM" #paste valid token here

    @f_connection = FGraph::Connection.new
    @f_connection_valid = FGraph::Connection.new @valid_params
  end

  it "should create connection object even without params" do
    @f_connection.class.name.should == "FGraph::Connection"
  end

  it "should return oauth2 client object" do
    @f_connection.client.class.name.should == "OAuth2::Client"
  end

  it "should say that you are not authorized without token" do
    @f_connection.is_authorized?.should == false
  end

  it "should pass validation of token if you provide correct one" do
    @f_connection_valid.token = @valid_token
    @f_connection_valid.is_authorized?.should == true
  end
end