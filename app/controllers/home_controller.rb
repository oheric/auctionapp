class HomeController < ApplicationController
def index
	if params[:price]
	search_query = URI.escape(params[:price])
	@item = JSON.parse(HTTParty.get("http://svcs.ebay.com/services/search/FindingService/v1?OPERATION-NAME=findItemsByCategory&SERVICE-VERSION=1.12.0&SECURITY-APPNAME=EricOh5d8-b3ea-46db-b11d-37a78febfe4&RESPONSE-DATA-FORMAT=JSON&REST-PAYLOAD&categoryId=15724&itemFilter.name=MaxPrice&itemFilter.value=" + search_query.to_s + "&itemFilter.paramName=Currency&itemFilter.paramValue=USD&paginationInput.entriesPerPage=9").body)



	# @item = JSON.parse(HTTParty.get("http://svcs.ebay.com/services/search/FindingService/v1?OPERATION-NAME=findItemsByKeywords&SERVICE-VERSION=1.12.0&SECURITY-APPNAME=EricOh5d8-b3ea-46db-b11d-37a78febfe4&RESPONSE-DATA-FORMAT=JSON&REST-PAYLOAD&keywords=harry%20potter%20phoenix&itemFilter.name=MaxPrice&itemFilter.value=" + search_query.to_s + "&itemFilter.paramName=Currency&itemFilter.paramValue=USD&paginationInput.entriesPerPage=3").body)
end
end

end