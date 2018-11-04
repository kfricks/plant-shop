import React from "react"
import PropTypes from "prop-types"
import PlantListItem from './PlantListItem';
class PlantListUserA extends React.Component {
  render () {
    return (
      <div>
        <React.Fragment>
        PLANT LIST USER A
          <PlantListItem/>
          <div style="width: 30%; float: left;">
            <h2>My plants</h2>
            <ul>
               current_user.plants.each do |plant|
                <li> plant.plant_type.common_name.try(:titleize) </li>
               end
            </ul>
          </div>
        </React.Fragment>
      </div>
    );
  }
}

export default PlantListUserA
