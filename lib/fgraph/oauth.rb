# Oauth class for authentication
require "oauth2"
module FGraph
  class Oauth

    # Create Facebook aouth object
    #
    # full stack of options:
    # opt={
    #  :api_url =>  "",
    #  :app_id =>  "",
    #  :app_secret =>  "",
    #  :callback_url => "",
    #  :access_token => "",
    #  :scopes => 'email,offline_access,read_stream,read_insights,manage_pages,read_mailbox,user_about_me,friends_about_me,user_activities,friends_activities,user_birthday,friends_birthday,user_education_history,friends_education_history,user_events,friends_events,user_groups,friends_groups,user_hometown,friends_hometown,user_interests,friends_interests,user_likes,friends_likes,user_location,friends_location,user_notes,friends_notes,user_online_presence,friends_online_presence,user_photo_video_tags,friends_photo_video_tags,user_photos,friends_photos,user_relationships,friends_relationships,user_religion_politics,friends_religion_politics,user_status,friends_status,user_videos,friends_videos,user_website,friends_website,user_work_history,friends_work_history'
    # }

    def initialize opt={}
      @facebook_app = {}
      opt.each { |key, v| @facebook_app[key.to_sym] = v }
      #p @facebook_app
    end

    # get client object
    def client
      OAuth2::Client.new @facebook_app[:app_id], @facebook_app[:app_secret], :site => @facebook_app[:api_url]
    end

    def rails_authorize_redirect
      client.web_server.authorize_url(
       :redirect_uri => @facebook_app[:callback_url],
       :scope => @facebook_app[:scopes]
      )
    end

    def accept_token code
      token_obj = client.web_server.get_access_token(code, {:redirect_uri => @facebook_app[:callback_url]})
      @token = token_obj.token
    end

    def get_access_token
      @token
    end

    def valid_token?
      auth_api_connect or nil
    end

    def auth_api_connect
      OAuth2::AccessToken.new client, @token
    end

    def test_me
      auth_api_connect.get('/me/feed')
    end
  end
end