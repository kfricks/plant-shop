import React from "react"
import PropTypes from "prop-types"
import { DragDropContext } from 'react-beautiful-dnd';
class PlantListItem extends React.Component {
  render () {
    return (
      <DragDropContext>
        <div className="plant-list-item-bg">
          <img src={this.props.plant.image} className="plant-list-item-image"/>
          <br />
          {/* #image tag with href that points to --> {this.props.plant.image} */}
          {this.props.plant.common_name} <em>({this.props.plant.scientific_name})</em>
          <br/>
        </div>
      </DragDropContext>
    );
  }
}

export default PlantListItem
