import React from "react";
import PropTypes from "prop-types";
import { DragDropContext, Droppable, Draggable } from "react-beautiful-dnd";
import PlantListItem from "./PlantListItem";

class PlantList extends React.Component {
  render() {
    return (
      <div>
        {this.props.plants.map((plant, index) => {
          return <PlantListItem plant={plant} key={plant.id} index={index} />;
        })}
      </div>
    );
  }
}

export default PlantList;
