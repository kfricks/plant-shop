import React from "react"
import PropTypes from "prop-types"
import PlantListItem from './PlantListItem';
import PlantListUserA from './PlantListUserA';
import PlantListUserB from './PlantListUserB';
class TradeItems extends React.Component {
  render () {
    return (
      <React.Fragment>
      TRADE ITEMS
      <PlantListUserA/>
      <PlantListUserB/>
      <div style="width: 30%; float: left;">
        < form_for @trade do |f| >
          < text_field_tag :plant_ids >
          < f.submit >
        < end >
      </React.Fragment>
    );
  }
}

export default TradeItems
