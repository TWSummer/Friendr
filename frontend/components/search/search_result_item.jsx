import React from 'react';
import { Link } from 'react-router-dom';

class SearchResultItem extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <Link to={`/profile/${this.props.user.username}`} className="search-result-item">
        <img src={this.props.user.primary_img_url} className="search-result-image"/>
        <div className="search-result-name-and-age">
          <h3>{this.props.user.name}</h3>
          <p>·</p>
          <h4>{this.props.user.age}</h4>
        </div>
        <br/>
        <div className="search-result-compatibility">
          <h2>{this.props.user.compatibility}%</h2>
        </div>
        <div className="search-result-compatibility">
          <h5>Compatibility</h5>
        </div>
        <br/>
        <div className="search-result-distance">
          {
            this.props.user.distance ? <p>Distance: {this.props.user.distance} Miles</p> : <p>Distance: Unknown</p>
          }
        </div>
        <br/>
      </Link>
    );
  }
}

export default SearchResultItem;
