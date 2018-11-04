import React from "react"
import PropTypes from "prop-types"
import PlantListUserA from './PlantListUserA';
import PlantListUserB from './PlantListUserB';
import TradeItems from './TradeItems';
class Trade extends React.Component {
  render () {
    console.log(this.props)
    return (
      <React.Fragment>
        TRADES BG
        this.plants.user_a_plants
        <PlantListUserA/>

        <TradeItems/>
        <PlantListUserB/>
      </React.Fragment>
    );
  }
}

export default Trade
