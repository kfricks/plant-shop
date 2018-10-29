require 'shippo'

Shippo::API.token = '<API_Token>'

address_from = {
    :name => 'Shawn Ippotle',
    :company => 'Shippo',
    :street1 => '215 Clayton St.',
    :street2 => '',
    :city => 'San Francisco',
    :state => 'CA',
    :zip => '94117',
    :country => 'US',
    :phone => '+1 555 341 9393',
    :email => 'shippotle@goshippo.com'
}

address_to = {
    :name => 'Mr Hippo"',
    :company => '',
    :street1 => 'Broadway 1',
    :street2 => '',
    :city => 'New York',
    :state => 'NY',
    :zip => '10007',
    :country => 'US',
    :phone => '+1 555 341 9393',
    :email => 'mrhippo@goshippo.com'
}

parcel = {
    :length => 5,
    :width => 1,
    :height => 5.555,
    :distance_unit => :cm,
    :weight => 2,
    :mass_unit => :lb
}

shipment = {
    :address_from => address_from,
    :address_to => address_to,
    :parcels => parcel
)

transaction = Shippo::Transaction.create(
    :shipment => shipment,
    :carrier_account => "b741b99f95e841639b54272834bc478c",
    :servicelevel_token => "usps_priority"
)
