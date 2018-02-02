import React from 'react';
import { Link } from 'react-router-dom';

class SiteHeader extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <header className="standard-header">
        <div className="left-header">
          <Link className="header-logo" to="/home">
            <img src="https://i.imgur.com/bQgZtp4.png" alt="logo"/>
          </Link>
          <Link className="header-link" to="/friends">Browse Friends</Link>
          <Link className="header-link" to="/questions">Answer Questions</Link>
        </div>
        <div className="right-header">
          <Link className="header-link" to="/messages">
            <i className="fas fa-comment"></i>
          </Link>
          <Link className="header-link" to={`/profile/`}>Profile</Link>
          <button
            className="header-link"
            onClick={this.props.logout.bind(this)}
            >Log Out</button>
        </div>
      </header>
    );
  }
}

export default SiteHeader;
