import React from 'react';
import ProfileHeader from './profile_header';

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
        <ProfileHeader
          profile={this.props.profile}
          session={this.props.session}
          updateProfile={this.props.updateProfile}/>
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
