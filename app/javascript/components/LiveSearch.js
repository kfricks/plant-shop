import React from "react"
import PropTypes from "prop-types"
import {Typeahead} from 'react-typeahead'; // ES2015
class LiveSearch extends React.Component {
  constructor(props) {
    super(props)
    this.state = { options: []}
    this.search = this.search.bind(this)
  }

  search(event) {
    var query = event.target.value
    console.log(event.target.value)
    let that = this
    $.get(`/plant_types/search?query=${query}`)
    .success(function(response){
      that.setState({options: response.plant_types})
      // attempting to uppercase:
      // that.setState({options: response.plant_types.toUpperCase()})
    })
  }
  updateOptions(options) {
    this.setState({options: options})
  }

  handleSelection(item){
    console.log('selected:', item)
    $('#plant_plant_type_id').val(item.id)
  }

  render () {
    return (
      <React.Fragment>
        <Typeahead
          onKeyUp={this.search}
          options={this.state.options}
          filterOption={"common_name"}
          displayOption={"common_name"}
          onOptionSelected={this.handleSelection}
          maxVisible={10}
        />
      </React.Fragment>
    );
  }
}

export default LiveSearch
