import React from 'react';

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
      profileBody = (
        <p>This is the profile of {this.props.profile.name}</p>
      );
    }
    return (
      <div>
        {profileBody}
      </div>
    );
  }
}

export default Profile;
