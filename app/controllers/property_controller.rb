require 'nokogiri'
require 'open-uri'

class PropertyController < ApplicationController
    before_action :valid_extension?, only: [:create]

    def create
        parse_properties_file
    end

    private

    def valid_extension?
        if(File.extname(params[:url]) != '.xml')
            redirect_to rentable_path, alert: 'Invalid file type.'
        end
    end

    def parse_properties_file
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

        redirect_to rentable_path, notice: 'File parsed.'
    end
end
