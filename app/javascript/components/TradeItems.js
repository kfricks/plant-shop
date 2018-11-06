import React from "react";
import { Droppable } from "react-beautiful-dnd";
import PropTypes from "prop-types";
// import { DragDropContext } from 'react-beautiful-dnd';
import PlantListItem from "./PlantListItem";

class TradeItems extends React.Component {
  render() {
    return (
      <Droppable droppableId={this.props.id}>
        {provided => (
          <div innerRef={provided.innerRef} {...provided.droppableProps}>
            TRADE ITEMS
            {this.props.plants.map((plant, index) => {
              return (
                <PlantListItem plant={plant} key={plant.id} index={index} />
              );
            })}
            {provided.placeholder}
          </div>
        )}
      </Droppable>
    );
  }
}

export default TradeItems;
