import React from "react"
import PropTypes from "prop-types"
import { DragDropContext } from 'react-beautiful-dnd';
import PlantListItem from './PlantListItem';
class PlantList extends React.Component {
  render () {
    return (
      <DragDropContext>
        <div>
          {this.props.plants.map(plant => {
            return <PlantListItem plant={plant} key={plant.id}/>
          })}
        </div>
      </DragDropContext>
    );
  }
}

export default PlantList
