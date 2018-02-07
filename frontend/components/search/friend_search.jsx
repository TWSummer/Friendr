import React from 'react';
import { merge } from 'lodash';
import SearchResultItem from './search_result_item';

class FriendSearch extends React.Component {
  constructor(props) {
    super(props);
    this.state = { search: this.props.search, sortType: "Compatibility" };
    this.searchQueryString = this.searchQueryString.bind(this);
    this.modifySearchForm = this.modifySearchForm.bind(this);
    this.updateSearch = this.updateSearch.bind(this);
    this.keyDown = this.keyDown.bind(this);
    this.setAnywhere = this.setAnywhere.bind(this);
    this.setAnytime = this.setAnytime.bind(this);
    this.includeErrors = this.includeErrors.bind(this);
    this.changeSort = this.changeSort.bind(this);
  }

  componentDidMount() {
    this.props.fetchSearch()
      .then(() => this.setState({search: this.props.search }));
  }

  searchQueryString() {
    let ageString = "any age";
    if (this.props.search.min_age && !this.props.search.max_age) {
      ageString = `at least ${this.props.search.min_age} years old`;
    } else if (!this.props.search.min_age && this.props.search.max_age) {
      ageString = `at most ${this.props.search.max_age} years old`;
    } else if (this.props.search.min_age && this.props.search.max_age) {
      ageString = `ages ${this.props.search.min_age}-${this.props.search.max_age}`;
    }
    let locationString = "anywhere";
    if (this.props.search.max_distance) {
      locationString = `within ${this.props.search.max_distance} miles`;
    }
    let activeWithinString = "anytime";
    if (this.props.search.active_within) {
      activeWithinString = `within ${this.props.search.active_within} days`;
    }
    return (
      <span>
        All friends <button onClick={this.editField("ageRange").bind(this)}>{ageString}</button>&nbsp;
        located <button onClick={this.editField("locatedWithin").bind(this)}>{locationString}</button>&nbsp;
        active <button onClick={this.editField("activeWithin").bind(this)}>{activeWithinString}</button>
    </span>
    );
  }

  editField(field) {
    return () => this.setState({edit: field});
  }

  editSearch(field) {
    return (e) => {
      let newSearch;
      newSearch = merge({}, this.state.search, {[field]: e.target.value});
      this.setState({search: newSearch});
    };
  }

  updateSearch() {
    this.props.updateSearch(this.state.search)
      .then(() => this.setState({edit: ""}));
  }

  stopPropagation(e) {
    e.stopPropagation();
  }

  keyDown(e) {
    if (e.key === "Enter") {
      this.updateSearch();
    }
    if (e.key == "Escape") {
      this.setState({search: this.props.search, edit: ""});
    }
  }

  setAnywhere(e) {
    let newSearch;
    if (this.state.search.max_distance) {
      newSearch = merge({}, this.state.search, {max_distance: null});
    } else {
      newSearch = merge({}, this.state.search, {max_distance: 50});
    }
    this.setState({search: newSearch});
  }

  setAnytime(e) {
    let newSearch;
    if (this.state.search.active_within) {
      newSearch = merge({}, this.state.search, {active_within: null});
    } else {
      newSearch = merge({}, this.state.search, {active_within: 21});
    }
    this.setState({search: newSearch});
  }

  includeErrors() {
    return (
      <ul className="error-list">
        {
          this.props.errors ? this.props.errors.map( (error, idx) => (
            <li className="search-errors" key={idx}>{error}</li>
          )) : ""
        }
      </ul>
    );
  }

  changeSort(e) {
    this.setState({sortType: e.target.value});
  }

  modifySearchForm() {
    if (this.state.edit === "ageRange") {
      return (
        <div className="add-shadow" onClick={this.updateSearch}>
          <div className="search-edit-box" onClick={this.stopPropagation} onKeyDown={this.keyDown}>
            {this.includeErrors()}
            <form className="search-edit-form">
              <label><div>Min Age</div>
                <input
                  type="number"
                  className="update-search-number-input"
                  min="18"
                  max="118"
                  autoFocus={true}
                  onChange={this.editSearch("min_age").bind(this)}
                  value={this.state.search.min_age ? this.state.search.min_age : 18}
                  ></input>
              </label>
              <br/>
                <label><div>Max Age</div>
                  <input
                    type="number"
                    className="update-search-number-input"
                    min="18"
                    max="118"
                    onChange={this.editSearch("max_age").bind(this)}
                    value={this.state.search.max_age ? this.state.search.max_age : 99}
                    ></input>
                </label>
            </form>
          </div>
        </div>
      );
    }
    if (this.state.edit ==="locatedWithin") {
      return (
        <div className="add-shadow" onClick={this.updateSearch}>
          <div className="search-edit-box" onClick={this.stopPropagation} onKeyDown={this.keyDown}>
            {this.includeErrors()}
            <form className="search-edit-form">
              <label><div>Max Distance</div>
                <input
                  type="number"
                  className="update-search-number-input"
                  min="1"
                  max="12000"
                  autoFocus={true}
                  disabled={this.state.search.max_distance ? false : true }
                  onChange={this.editSearch("max_distance").bind(this)}
                  value={this.state.search.max_distance ? this.state.search.max_distance : ""}
                  ></input>
              </label>
              <br/>
              <label className="check-label">
                <input
                  type="checkbox"
                  className="checkbox"
                  name="friend-answer"
                  checked={this.state.search.max_distance ? false : true}
                  onChange={this.setAnywhere}
                  />
                <span className="search-checkmark"></span>
                Any Distance<br/>
              </label>
            </form>
          </div>
        </div>
      );
    }
    if (this.state.edit ==="activeWithin") {
      return (
        <div className="add-shadow" onClick={this.updateSearch}>
          <div className="search-edit-box" onClick={this.stopPropagation} onKeyDown={this.keyDown}>
            {this.includeErrors()}
            <form className="search-edit-form">
              <label><div>Number of Days</div>
                <input
                  type="number"
                  className="update-search-number-input"
                  min="1"
                  max="2000"
                  autoFocus={true}
                  disabled={this.state.search.active_within ? false : true }
                  onChange={this.editSearch("active_within").bind(this)}
                  value={this.state.search.active_within ? this.state.search.active_within : ""}
                  ></input>
              </label>
              <br/>
              <label className="check-label">
                <input
                  type="checkbox"
                  className="checkbox"
                  name="friend-answer"
                  checked={this.state.search.active_within ? false : true}
                  onChange={this.setAnytime}
                  />
                <span className="search-checkmark"></span>
                Any Time<br/>
              </label>
            </form>
          </div>
        </div>
      );
    }
  }

  render() {
    return (
      <div className="full-search-component">
        <header className="search-header">
          {this.modifySearchForm()}
          <span className="search-parameters">
            {this.searchQueryString()}
          </span>
        </header>
        <div className="search-results">
          <form className="sort-select-form">
            <label>Sort By
              <select
                className="sort-select"
                value={this.state.sortType}
                onChange={this.changeSort}>
                <option value="Compatibility">Compatibility</option>
                <option value="Distance">Distance</option>
              </select>
            </label>
          </form>
          {
            this.props.resultsByCompatibility ?
            this.state.sortType === "Compatibility" ?
            this.props.resultsByCompatibility.map( (result) => {
              return (
                <SearchResultItem user={result} key ={result.id} />
              );
            }) :
            this.props.resultsByDistance.map( (result) => {
              return (
                <SearchResultItem user={result} key ={result.id} />
              );
            }) : ""
          }
        </div>
      </div>
    );
  }
}

export default FriendSearch;
