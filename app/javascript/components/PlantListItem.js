import React from "react"
import PropTypes from "prop-types"
class PlantListItem extends React.Component {
  render () {
    return (
      <React.Fragment>
        {/* I'm a plant */}
        <div className="plant-list-item-bg">
        <img src="{this.props.plant.image}"/>
       {/* #image tag with href that points to --> {this.props.plant.image} */}
        {this.props.plant.common_name} <em>({this.props.plant.scientific_name})</em>
        <br/>
        </div>
      </React.Fragment>
    );
  }
}

export default PlantListItem
