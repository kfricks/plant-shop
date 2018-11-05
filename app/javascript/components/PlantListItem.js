import React from "react"
import PropTypes from "prop-types"
class PlantListItem extends React.Component {
  render () {
    return (
      <React.Fragment>
        I'm a plant
        {this.props.plant.common_name}
      </React.Fragment>
    );
  }
}

export default PlantListItem
