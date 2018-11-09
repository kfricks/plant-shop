import React from "react";
import PropTypes from "prop-types";
import { Draggable } from "react-beautiful-dnd";
class PlantListItem extends React.Component {
  render() {
    return (
      <Draggable draggableId={this.props.plant.id} index={this.props.index}>
        {provided => (
          <div
            className="plant-list-item-bg"
            {...provided.draggableProps}
            {...provided.dragHandleProps}
            ref={provided.innerRef}
          >
            <img
              src={this.props.plant.image}
              className="plant-list-item-image"
            />
            <br />
            <div>
              {this.props.plant.common_name} <br />
              <em>({this.props.plant.scientific_name})</em>
            </div>
          </div>
        )}
      </Draggable>
    );
  }
}

export default PlantListItem;
