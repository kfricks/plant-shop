import React from "react";
import PropTypes from "prop-types";
import PlantListItem from "./PlantListItem";
import { Droppable } from "react-beautiful-dnd";

class TradeItems extends React.Component {
  render() {
    return (
      <Droppable droppableId={this.props.id}>
        {provided => (
          <div ref={provided.innerRef} {...provided.droppableProps}>
            <section className="trade-container-trades-area">
              {this.props.plants.map((plant, index) => {
                return (
                  <PlantListItem plant={plant} key={plant.id} index={index} />
                );
              })}
              {provided.placeholder}
            </section>
          </div>
        )}
      </Droppable>
    );
  }
}

export default TradeItems;
