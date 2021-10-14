require 'nokogiri'
require 'open-uri'

class PropertyController < ApplicationController

    def create
        doc = Nokogiri::XML(URI.open(params[:url]))
        properties = doc.xpath("//PhysicalProperty/Property/PropertyID")
        #Need to get PropertyID
        andy = properties.map do |property|
            [property.at('MarketingName').text, property.at('Email').text, property.at('Address').at('City').text] 
        end

        #Floorplan.Room.Count  (if RoomType === "Bedroom")
        puts andy.inspect
    end

    def index
    end
end
