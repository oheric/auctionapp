class HomeController < ApplicationController
def index
	# @search_query = URI.escape(params[:search])
	@search = JSON.parse(HTTParty.get("http://svcs.ebay.com/services/search/FindingService/v1?OPERATION-NAME=findItemsByKeywords&SERVICE-VERSION=1.0.0&SECURITY-APPNAME=EricOh5d8-b3ea-46db-b11d-37a78febfe4&RESPONSE-DATA-FORMAT=JSON&REST-PAYLOAD&keywords=harry%20potter%20phoenix").body)
end

end