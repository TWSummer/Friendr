import React from 'react';
import ProfileSectionItem from './profile_section_item';

class profileSection extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <section className="profile-section">
        <h1>About Me</h1>
        <ProfileSectionItem
          profile={this.props.profile}
          updateProfile={this.props.updateProfile}
          type="about_me" />
        <h1>What I'm Looking For</h1>
        <ProfileSectionItem
          profile={this.props.profile}
          updateProfile={this.props.updateProfile}
          type="looking_for" />
      </section>
    );
  }
}

export default profileSection;
