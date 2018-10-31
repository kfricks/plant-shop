import React from "react"
import PropTypes from "prop-types"
import {Typeahead} from 'react-typeahead'; // ES2015
class LiveSearch extends React.Component {
  constructor() {
    super()
    this.state = { options: []}
  }

  search() {
    // $.get(`/plant_types/search?query=$(WHATUSERTYPED)}`)
    // .success(this.updateOptions(response))
  }
  // updateOptions(options)=> {
  //   this.setStateOptions: options
  // }
  render () {
    return (
      <React.Fragment>
        <Typeahead
          // onKeyDown={this.search}
          // options={['John', 'Paul', 'George', 'Ringo']}
          options={this.state.options}
          maxVisible={10}
        />
      </React.Fragment>
    );
  }
}

export default LiveSearch
