import React from "react";
import PropTypes from "prop-types";
import { DragSource } from "react-dnd";

class PlantListItem extends React.Component {
  render() {
    return (
      <div className="plant-list-item-bg">
        <img src={this.props.plant.image} className="plant-list-item-image" />
        <br />
        {this.props.plant.common_name}{" "}
        <em>({this.props.plant.scientific_name})</em>
        <br />
      </div>
    );
  }
}

export default PlantListItem;
