import React from "react";
import PropTypes from "prop-types";
import { Draggable } from "react-beautiful-dnd";
class PlantListItem extends React.Component {
  render() {
    return (
      <Draggable draggableId={this.props.plant.id} index={this.props.index}>
        {provided => (
          <div
            className="c-card plant-card"
            {...provided.draggableProps}
            {...provided.dragHandleProps}
            ref={provided.innerRef}
          > 
            <img
              src={this.props.plant.image}
              className="plant-card-image"
            />
            <br />
            <div className="plant-card-title u-padding-tiny">
              <div className="c-title c-title--small u-padding-top-small u-margin-bottom-tiny">{this.props.plant.common_name}</div>
              <div className="c-title c-title--label u-margin-bottom-small u-margin-top-none">
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
