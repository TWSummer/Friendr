import React from 'react';
import ReactDOM from 'react-dom';

class ProfileHeader extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <header className="view-profile-header">
        <main>
          <img
            className="view-profile-image-holder"
            src={this.props.profile.primary_img_url}
            alt="Profile image"/>
          <div className="view-profile-header-fields">
              <div className="view-name-box">
                <h1>{this.props.profile.name}</h1>
                <p>•</p>
                <h3>{this.props.profile.age}</h3>
              </div>
            </div>
        </main>
      </header>
    );
  }
}

export default ProfileHeader;
