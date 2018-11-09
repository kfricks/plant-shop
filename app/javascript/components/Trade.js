import React from "react";
import PlantList from "./PlantList";
import { DragDropContext } from "react-beautiful-dnd";
import TradeItems from "./TradeItems";

class Trade extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      user_a_plants: props.user_a_plants,
      user_b_plants: props.user_b_plants,
      user_a_trade_plants: props.user_a_trade_plants,
      user_b_trade_plants: props.user_b_trade_plants
    };

    this.onDragEnd = this.onDragEnd.bind(this);
  }

  move(source, destination, droppableSource, droppableDestination) {
    // drag from user_a plant list to user_a trade zone
    if (
      droppableSource.droppableId === "user_a_plants" &&
      droppableDestination.droppableId == "user_a_trade_plants"
    ) {
      let droppedItem = this.state.user_a_plants[source.index];

      this.setState({
        user_a_trade_plants: [...this.state.user_a_trade_plants, droppedItem],
        user_a_plants: this.state.user_a_plants.filter(
          (plant, index) => index !== source.index
        )
      });
      // drag from user_a trade zone to user_a plant list
    } else if (
      droppableSource.droppableId === "user_a_trade_plants" &&
      droppableDestination.droppableId == "user_a_plants"
    ) {
      let droppedItem = this.state.user_a_trade_plants[source.index];

      this.setState({
        user_a_plants: [...this.state.user_a_plants, droppedItem],
        user_a_trade_plants: this.state.user_a_trade_plants.filter(
          (plant, index) => index !== source.index
        )
      });
      // drag from user_b plant list to user_b trade zone
    } else if (
      droppableSource.droppableId === "user_b_plants" &&
      droppableDestination.droppableId == "user_b_trade_plants"
    ) {
      let droppedItem = this.state.user_b_plants[source.index];

      this.setState({
        user_b_trade_plants: [...this.state.user_b_trade_plants, droppedItem],
        user_b_plants: this.state.user_b_plants.filter(
          (plant, index) => index !== source.index
        )
      });
      // drag from user_b trade zone to plant list
    } else if (
      droppableSource.droppableId === "user_b_trade_plants" &&
      droppableDestination.droppableId == "user_b_plants"
    ) {
      let droppedItem = this.state.user_b_trade_plants[source.index];

      this.setState({
        user_b_plants: [...this.state.user_b_plants, droppedItem],
        user_b_trade_plants: this.state.user_b_trade_plants.filter(
          (plant, index) => index !== source.index
        )
      });
    }
  }

  onDragEnd(result) {
    const { source, destination } = result;
    console.log("dragging!");
    if (!destination) {
      return;
    } else {
      this.move(result.source, result.destination, source, destination);
    }
  }

  render() {
    return (
      <div>
        <DragDropContext onDragEnd={this.onDragEnd}>
          <div className="headline-with-button">
            <h1 className="u--float-left">
              Your trade with {this.props.user_b_name}
            </h1>
            <div>
              <button className="c-button c-button--focal u--float-right">
                Propose Trade
              </button>
            </div>
          </div>
          <section className="plant-shelf-container">
            <h2>Your plant shelf:</h2>
            <PlantList plants={this.state.user_a_plants} id="user_a_plants" />
          </section>

          <section className="trade-section-container">
            <h2>Plants I want</h2>
            <TradeItems
              plants={this.state.user_b_trade_plants}
              id="user_b_trade_plants"
            />
            <h2>Plants I'm trading</h2>
            <TradeItems
              plants={this.state.user_a_trade_plants}
              id="user_a_trade_plants"
            />
            <br />
            <button className="c-button c-button--focal c-button--full-width">
              Propose Trade
            </button>
          </section>

          <section className="plant-shelf-container">
            <h2>
              {this.props.user_b_name}
              's Plant Shelf
            </h2>
            <PlantList plants={this.state.user_b_plants} id="user_b_plants" />
          </section>
        </DragDropContext>
      </div>
    );
  }
}

export default Trade;
