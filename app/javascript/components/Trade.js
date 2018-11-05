import React from "react"
import PlantList from './PlantList';
import TradeItems from './TradeItems';
class Trade extends React.Component {
  render () {
    return (
      <React.Fragment>

        <h2>TRADE BUDDY: {this.props.user_b_name}</h2>
        TRADES BG

        <PlantList plants={this.props.user_a_plants} />
        <TradeItems/>
        <PlantList plants={this.props.user_b_plants} />

      </React.Fragment>
    );
  }
}

export default Trade
