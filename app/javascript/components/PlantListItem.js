import React from "react"
import PropTypes from "prop-types"
class PlantListItem extends React.Component {
  render () {
    return (
      <div className="plant-list-item-bg">
        <img src={this.props.plant.image}/>
        <br />
        {/* #image tag with href that points to --> {this.props.plant.image} */}
        {this.props.plant.common_name} <em>({this.props.plant.scientific_name})</em>
        <br/>
      </div>
    );
  }
}

export default PlantListItem
