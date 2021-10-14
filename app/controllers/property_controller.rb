require 'nokogiri'
require 'open-uri'

class PropertyController < ApplicationController

    def create
        # Add check for only xml file here
        doc = Nokogiri::XML(URI.open(params[:url]))
        properties = doc.xpath("//PhysicalProperty/Property/PropertyID")

        properties.each do |property|
            Property.create(
                rentableId: property.at('Identification').attribute('IDValue').value,
                name: property.at('MarketingName').text,
                email: property.at('Email').text,
                city: property.at('Address').at('City').text,
                state: property.at('Address').at('State').text
            )
        end

        redirect_to property_index_path, notice: 'File Parsed'
    end

    def index
    end
end
