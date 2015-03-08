require 'uri'
class WclothingController < ApplicationController
  def index
    @popular = JSON.parse(HTTParty.get("http://open.api.ebay.com/shopping?callname=FindPopularSearches&responseencoding=JSON&appid=EricOh5d8-b3ea-46db-b11d-37a78febfe4&siteid=0&version=533&CategoryID=15724").body)

	@popular['PopularSearchResult'].each do |p|
	alternative = p['AlternativeSearches'].split(';') 
	related = p['RelatedSearches'].split(';') 
	@keywords = alternative.concat(related) 
	if params[:price]
		search_query = URI.escape(params[:price])
		@item = JSON.parse(HTTParty.get("http://svcs.ebay.com/services/search/FindingService/v1?OPERATION-NAME=findItemsByKeywords&SERVICE-VERSION=1.12.0&SECURITY-APPNAME=EricOh5d8-b3ea-46db-b11d-37a78febfe4&RESPONSE-DATA-FORMAT=JSON&REST-PAYLOAD&keywords=" + URI.encode(@keywords.sample) + "&categoryId=15724&itemFilter(0).name=MaxPrice&itemFilter(0).value=" + search_query + "&itemFilter(1).paramName=Currency&itemFilter(1).paramValue=USD&itemFilter(2).name=HideDuplicateItems&itemFilter(2).value=true&itemFilter(3).name=EndTimeTo&itemFilter(3).value=" + (DateTime.now + 200.minutes).to_s + "&paginationInput.entriesPerPage=25").body)
	else
		@item = JSON.parse(HTTParty.get("http://svcs.ebay.com/services/search/FindingService/v1?OPERATION-NAME=findItemsByKeywords&SERVICE-VERSION=1.12.0&SECURITY-APPNAME=EricOh5d8-b3ea-46db-b11d-37a78febfe4&RESPONSE-DATA-FORMAT=JSON&REST-PAYLOAD&keywords=" + URI.encode(@keywords.sample) + "&categoryId=15724&itemFilter(0).name=MaxPrice&itemFilter(0).value=10&itemFilter(1).paramName=Currency&itemFilter(1).paramValue=USD&itemFilter(2).name=HideDuplicateItems&itemFilter(2).value=true&itemFilter(3).name=EndTimeTo&itemFilter(3).value=" + (DateTime.now + 200.minutes).to_s + "&paginationInput.entriesPerPage=25").body)
	end
	end
end

	def refresh
		redirect_to :back
	end

	end