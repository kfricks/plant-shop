import React from "react"
import PropTypes from "prop-types"
import {Typeahead} from 'react-typeahead'; // ES2015
class LiveSearch extends React.Component {
  constructor() {
    super()
    this.state = { options: []}
  }

  search(event) {
    var query = event.target.value
    console.log(event.target.value)
    $.get(`/plant_types/search?query=${query}`)

    // .success(this.updateOptions(response))
  }
  // updateOptions(options)=> {
  //   this.setStateOptions: options
  // }
  render () {
    return (
      <React.Fragment>
        <Typeahead
          onKeyUp={this.search}
          options={this.state.options}
          maxVisible={10}
        />
      </React.Fragment>
    );
  }
}

export default LiveSearch
