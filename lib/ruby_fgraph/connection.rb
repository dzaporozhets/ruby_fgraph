require "rubygems"
require "oauth2"
# Connection class
# for authentication
# and api queries
# based on oauth2 gem
module FGraph
  class Connection
    attr_writer :token

    # Create Facebook connection object
    # for future authorization
    # and query requests
    def initialize opt={}
      @facebook_app = {
        :api_url =>  "https://graph.facebook.com",
        :app_id =>  "",
        :app_secret =>  "",
        :callback_url => "",
        :access_token => "",
        :scopes => 'email,offline_access,read_stream,user_about_me'
      }
      opt.each { |key, v| @facebook_app[key.to_sym] = v }
    end

    # check if connection
    # authorized (get correct token)
    def is_authorized?
      valid_token? ? true : false
    end

    # get oauth2 client object
    # for authorization
    # so token can be recieved
    def client
      @client ||= OAuth2::Client.new @facebook_app[:app_id], @facebook_app[:app_secret], :site => @facebook_app[:api_url]
    end

    # get authorize url
    # for redirection from app
    def rails_authorize_redirect
      client.web_server.authorize_url(
        :redirect_uri => @facebook_app[:callback_url],
        :scope => @facebook_app[:scopes]
      )
    end

    # get token using code
    # after auth passed
    def accept_token code
      token_obj = client.web_server.get_access_token(code, {:redirect_uri => @facebook_app[:callback_url]})
      @token = token_obj.token
    end

    # get access token
    # for auth queries
    def get_access_token
      @token
    end

    # check if token
    # is valid
    def valid_token?
      begin
        self.query
        return true
      rescue Exception => ex
        return false
      end
    end

    # authorization connect
    # using token for future request
    def auth_api_connect
      @auth_api_connect ||= OAuth2::AccessToken.new client, @token
    end

    # get api response for query
    # only for auth connections
    def query string = '/me'
      auth_api_connect.get(string)
    end
  end
end