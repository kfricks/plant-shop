import React from "react";
import PropTypes from "prop-types";
import { Draggable } from "react-beautiful-dnd";
class PlantListItem extends React.Component {
  render() {
    return (
      <Draggable draggableId={this.props.plant.id} index={this.props.index}>
        {provided => (
          <div
            className="plant-list-item"
            {...provided.draggableProps}
            {...provided.dragHandleProps}
            ref={provided.innerRef}
          >
            <img
              src={this.props.plant.image}
              className="plant-list-item-image clip-circle"
            />
            <br />
            <div className="plant-list-item--plant-name">
              <div className="common-name">{this.props.plant.common_name}</div>
              <div className="scientific-name">
                {this.props.plant.scientific_name}
              </div>
            </div>
          </div>
        )}
      </Draggable>
    );
  }
}

export default PlantListItem;
