import React from "react";
import PropTypes from "prop-types";
import { Droppable } from "react-beautiful-dnd";
import PlantListItem from "./PlantListItem";
class PlantList extends React.Component {
  render() {
    return (
      <Droppable droppableId={this.props.plants.id}>
        {provided => (
          <div innerRef={provided.innerRef} {...provided.droppableProps}>
            {this.props.plants.map((plant, index) => {
              return <PlantListItem plant={plant} key={plant.id} />;
            })}
            {provided.placeholder}
          </div>
        )}
      </Droppable>
    );
  }
}

export default PlantList;
