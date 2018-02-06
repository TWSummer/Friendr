import React from 'react';
import ViewProfileSectionItem from './view_profile_section_item';

class viewProfileSection extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <section className="profile-section">
        <h1>About Me</h1>
        <ViewProfileSectionItem
          profile={this.props.profile}
          type="about_me" />
        <h1>What I'm Looking For</h1>
        <ViewProfileSectionItem
          profile={this.props.profile}
          type="looking_for" />
      </section>
    );
  }
}

export default viewProfileSection;
