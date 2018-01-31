import React from 'react';
import { Link } from 'react-router-dom';

class SiteHeader extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        <button onClick={this.props.logout.bind(this)}>Log Out</button>
      </div>
    );
  }
}

export default SiteHeader;
