import React from "react"
import PropTypes from "prop-types"
import PlantListItem from './PlantListItem';
class PlantList extends React.Component {
  render () {
    return (
      <div>
        {this.props.plants.map(plant => {
          return <PlantListItem plant={plant} key={plant.id}/>
        })}
      </div>
    );
  }
}

export default PlantList
