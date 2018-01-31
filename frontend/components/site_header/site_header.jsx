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
          <div className="header-logo">Logo</div>
          <Link className="header-link" to="/friends">Browse Friends</Link>
          <Link className="header-link" to="/questions">Answer Questions</Link>
        </div>
        <div className="right-header">
          <Link className="header-link" to="/messages">Messages</Link>
          <Link className="header-link" to={`/profile/${this.props.currentUser.username}`}>Profile</Link>
          <button className="header-button" onClick={this.props.logout.bind(this)}>Log Out</button>
        </div>
      </header>
    );
  }
}

export default SiteHeader;
