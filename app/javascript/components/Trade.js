import React from "react"
import PlantList from './PlantList';
import TradeItems from './TradeItems';
class Trade extends React.Component {
  render () {
    return (
      <div>
        <h2>Your trade with {this.props.user_b_name}:</h2>

        <h3>Your plant shelf:</h3>
        <PlantList plants={this.props.user_a_plants} />
        <TradeItems/>

        <h3>{this.props.user_b_name}'s Plant Shelf</h3>
        <PlantList plants={this.props.user_b_plants} />

      </div>
    );
  }
}

export default Trade
