import React from "react";
import PropTypes from "prop-types";
// import { DragDropContext } from 'react-beautiful-dnd';
import { Droppable } from "react-beautiful-dnd";
import PlantListItem from "./PlantListItem";

class TradeItems extends React.Component {
  render() {
    return (
      <div>
        TRADE ITEMS
        {this.props.plants.map((plant, index) => {
          return <PlantListItem plant={plant} key={plant.id} index={index} />;
        })}
      </div>
    );
  }
}

export default TradeItems;
