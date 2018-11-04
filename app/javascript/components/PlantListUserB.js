import React from "react"
import PropTypes from "prop-types"
import PlantListItem from './PlantListItem';
class PlantListUserB extends React.Component {
  render () {
    return (
      <div>
        <React.Fragment>
        PLANT LIST USER B
          <PlantListItem/>

          <div style="width: 30%; float: left;">
            <h2>< @trade.user_b.name %>'s Plants</h2>
            <ul>
              < @trade.user_b.plants.each do |plant| >
                <li>< plant.plant_type.common_name ></li>
              < end >
            </ul>
          </div>

        </React.Fragment>
      </div>
    );
  }
}

export default PlantListUserB
