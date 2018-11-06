import React from "react";
import { DragDropContext } from "react-beautiful-dnd";
import PlantList from "./PlantList";
import TradeItems from "./TradeItems";
class Trade extends React.Component {
  onDragEnd = result => {
    // TODO: REORDER PLANTLIST.JS
  };

  render() {
    return (
      <DragDropContext>
        <div>
          <h2>Your trade with {this.props.user_b_name}:</h2>
          <section className="plant-shelf-container">
            <h3>Your plant shelf:</h3>
            <PlantList plants={this.props.user_a_plants} />
          </section>

          <section className="trade-section-container">
            <h2>Plants I want</h2>
            <section className="trade-section">
              <TradeItems
                id="user_a_trade_plants"
                plants={this.props.user_a_trade_plants}
              />
            </section>
            <h2>Plants I'm trading</h2>
            <section className="trade-section">
              <TradeItems
                id="user_b_trade_plants"
                plants={this.props.user_b_trade_plants}
              />
            </section>
          </section>

          <section className="plant-shelf-container">
            <h3>
              {this.props.user_b_name}
              's Plant Shelf
            </h3>
            <PlantList plants={this.props.user_b_plants} />
          </section>
        </div>
      </DragDropContext>
    );
  }
}

export default Trade;
