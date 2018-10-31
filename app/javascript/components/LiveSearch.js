import React from "react"
import PropTypes from "prop-types"
import {Typeahead} from 'react-typeahead'; // ES2015
class LiveSearch extends React.Component {
  render () {
    return (
      <React.Fragment>
        <Typeahead
          options={['John', 'Paul', 'George', 'Ringo']}
          maxVisible={2}
        />
      </React.Fragment>
    );
  }
}

export default LiveSearch
