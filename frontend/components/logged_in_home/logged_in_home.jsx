import React from 'react';
import { Link } from 'react-router-dom';

class LoggedInHome extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        You are logged in!
        <button onClick={this.props.logout.bind(this)}>Log Out</button>
      </div>
    );
  }
}

export default LoggedInHome;
