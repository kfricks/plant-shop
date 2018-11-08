import React from "react";
import PlantList from "./PlantList";
import { DragDropContext } from "react-beautiful-dnd";
import TradeItems from "./TradeItems";

class Trade extends React.Component {
  render() {
    return (
      <div>
        <h2>Your trade with {this.props.user_b_name}:</h2>
        <section className="plant-shelf-container">
          <h3>Your plant shelf:</h3>
          <DragDropContext>
            <PlantList plants={this.props.user_a_plants} />
          </DragDropContext>
        </section>

        <section className="trade-section-container">
          <h2>Plants I want</h2>
          <section className="trade-section">
            <TradeItems />
          </section>
          <h2>Plants I'm trading</h2>
          <section className="trade-section">
            <TradeItems />
          </section>
        </section>

        <section className="plant-shelf-container">
          <h3>
            {this.props.user_b_name}
            's Plant Shelf
          </h3>
          <DragDropContext>
            <PlantList plants={this.props.user_b_plants} />
          </DragDropContext>
        </section>
      </div>
    );
  }
}

export default Trade;
