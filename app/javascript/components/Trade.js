import React from "react";
import PlantList from "./PlantList";
import { DragDropContext } from "react-beautiful-dnd";
import TradeItems from "./TradeItems";

class Trade extends React.Component {
  constructor(props) {
    super(props);
    let shouldShowApproveButton = this.props.user_a_trade_plants.length > 0 && this.props.user_b_trade_plants.length > 0
    this.state = {
      user_a_plants: props.user_a_plants,
      user_b_plants: props.user_b_plants,
      user_a_trade_plants: props.user_a_trade_plants,
      user_b_trade_plants: props.user_b_trade_plants,
      proposer: props.proposer,
      show_propose_button: false,
      show_approve_button: shouldShowApproveButton
    };

    this.onDragEnd = this.onDragEnd.bind(this);
    this.proposeTrade = this.proposeTrade.bind(this);
    this.approveTrade = this.approveTrade.bind(this);
    this.tradeButtonsShouldRender = this.tradeButtonsShouldRender.bind(this);
  }

 tradeButtonsShouldRender() {
    let plantTradePopulated = this.state.user_a_trade_plants.length > 0 && this.state.user_b_trade_plants.length > 0
    let userATradePlantsChanged = this.state.user_a_trade_plants != this.props.user_a_trade_plants
    let userBTradePlantsChanged = this.state.user_b_trade_plants != this.props.user_b_trade_plants
    let plantTradeChanged = userATradePlantsChanged || userBTradePlantsChanged;

    if (plantTradePopulated && plantTradeChanged) {
      this.setState({ show_propose_button: true, show_approve_button: false });
    } 
    
    if (!plantTradePopulated) {
      this.setState({ show_propose_button: false, show_approve_button: false });
    }

    if (plantTradePopulated && !plantTradeChanged) {
      this.setState({ show_propose_button: false, show_approve_button: true });
    }
  }

  proposeTrade() {

    let payload = {
      trade_ids: [
        ...this.state.user_a_trade_plants.map(plant => plant.id),
        ...this.state.user_b_trade_plants.map(plant => plant.id)
      ]
    };

    $.ajax({
      type: "POST",
      url: `/trades/${this.props.trade_id}`,
      data: { _method: "PUT", ...payload },
      dataType: "json",
      complete: function(data) {
        window.location = window.location.toString().replace('/edit','')
      }
    });
  }

  approveTrade() {

    let payload = {
      status: "approved"
    };

    $.ajax({
      type: "PUT",
      url: `/trades/${this.props.trade_id}`,
      data: { _method: "PUT", ...payload },
      dataType: "json",
      complete: function(data) {
        // window.location = window.location.toString().replace('/edit','')
        window.location = '/approve'
      }
    });
  }

  button() {
    if (this.state.show_propose_button === true) {
      return(
        <button
          className="c-button c-button--focal c-button--full-width u-margin-bottom-small"
          onClick={this.proposeTrade}
          >
          Propose Trade
        </button>
      )
    } else if (this.state.show_approve_button === true) {
      return(
        <button
          className="c-button c-button--focal c-button--full-width u-margin-bottom-small"
          onClick={this.approveTrade}
          >
          Approve Trade
        </button>
      )
    };
  }

  // button() {
  //   if (this.props.proposer) {
  //     return(<button
  //       className="c-button c-button--focal c-button--full-width u-margin-bottom-small"
  //       onClick={this.proposeTrade}>
  //       Propose Trade
  //     </button>)
  //   } else {
  //     return(<button
  //       className="c-button c-button--focal c-button--full-width u-margin-bottom-small"
  //       onClick={this.approveTrade}>
  //       Approve Trade
  //     </button>)
  //   };
  // }

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
    //   // alert if user_a drags their own plant into user_b's trade zone
    // } else if (
    //   droppableSource.droppableId === "user_a_plants" &&
    //   droppableDestination.droppableId == "user_b_trade_plants"
    // ) {
    //   window.alert(
    //     "Wrong trade zone! The plants you want to give should go in the bottom section."
    //   );
    //   // alert if user_b drags their own plant into user_a's trade zone
    // } else if (
    //   droppableSource.droppableId === "user_b_plants" &&
    //   droppableDestination.droppableId == "user_a_trade_plants"
    // ) {
    //   window.alert(
    //     "Wrong trade zone! The plants you want to receive should go in the top section."
    //   );
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

    this.tradeButtonsShouldRender();
  }

  render() {
    return (
      <div>
        <div className="green-hero">
          <h2>
            Your trade with {this.props.user_b_name}
          </h2>
          <div>
          </div>
        </div>
        <DragDropContext onDragEnd={this.onDragEnd}>
          <div className="trade-container">
            <section className="trade-container-plants">
              <h2 className="c-title">
                {this.props.user_b_name}'s Plant Shelf
              </h2>
              <PlantList plants={this.state.user_b_plants} id="user_b_plants" />
            </section>

            <section className="trade-container-trades">
              <h2 className="c-title">Plants I Want</h2>
              <TradeItems
                plants={this.state.user_b_trade_plants}
                id="user_b_trade_plants"
              />

              {this.button()}

              <h2 className="c-title">Plants I'll Give</h2>
              <TradeItems
                plants={this.state.user_a_trade_plants}
                id="user_a_trade_plants"
              />
            </section>

            <section className="trade-container-plants">
              <h2 className="c-title">Your plant shelf</h2>
                <PlantList plants={this.state.user_a_plants} id="user_a_plants" />
            </section>
          </div>
        </DragDropContext>
      </div>
    );
  }
}

export default Trade;
