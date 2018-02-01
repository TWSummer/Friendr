import React from 'react';
import ProfileHeader from './profile_header';
import ProfileSection from './profile_section';
import ProfileAside from './profile_aside';

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
        <div>
          <ProfileHeader
            profile={this.props.profile}
            session={this.props.session}
            errors={this.props.errors}
            updateProfile={this.props.updateProfile}/>
          <main className="main-profile">
            <ProfileSection
              profile={this.props.profile}
              errors={this.props.errors}
              updateProfile={this.props.updateProfile} />
            <ProfileAside
              profile={this.props.profile}
              errors={this.props.errors}
              updateProfile={this.props.updateProfile} />
          </main>
        </div>
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
