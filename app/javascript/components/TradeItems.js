import React from "react"
import PropTypes from "prop-types"
// import { DragDropContext } from 'react-beautiful-dnd';
import { Droppable } from 'react-beautiful-dnd';
import PlantListItem from './PlantListItem';
class TradeItems extends React.Component {
  render () {
    return (
      <Droppable droppableId={this.props.column.did}>
        { provided => (
      <div>TRADE ITEMS</div>
      )}
      </Droppable>
    );
  }
}

export default TradeItems
