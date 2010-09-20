# Facebook Graph Api gem
# based on oauth2 gem
require "rubygems"
gem "oauth2"

module FGraph
  def self.root
    File.dirname(__FILE__)
  end
end

require "#{FGraph.root}/fgraph/oauth"
require "#{FGraph.root}/fgraph/query"
