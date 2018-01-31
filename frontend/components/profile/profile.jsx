import React from 'react';
import { Link } from 'react-router-dom';

class Profile extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.fetchProfile();
  }

  render() {
    let profileBody;
    if (this.props.profile) {
      profileBody = <p>Profile Body {this.props.profile.name}</p>;
    }
    return (
      <div>
        {profileBody}
      </div>
    );
  }
}

export default Profile;
