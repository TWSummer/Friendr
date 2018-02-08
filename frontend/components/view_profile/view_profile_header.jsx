import React from 'react';
import ReactDOM from 'react-dom';
import MessageButton from './message_button';

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
              <div className="view-name-box">
                <h2>{this.props.profile.compatibility}</h2>
                <h4>&nbsp; % Compatible</h4>
                <p>•</p>
                {
                  this.props.profile.distance ? (
                    <div className="flex-div">
                      <h4>Distance: &nbsp;</h4>
                      <h3>{this.props.profile.distance} Miles</h3>
                    </div>
                  ) : (
                    <div className="flex-div">
                      <h4>Distance: &nbsp;</h4>
                      <h3>Unknown</h3>
                    </div>
                  )
                }
              </div>
            </div>
            <MessageButton
              sendMessage={this.props.sendMessage}
              messageErrors={this.props.messageErrors}
              profile={this.props.profile}/>
        </main>
      </header>
    );
  }
}

export default ProfileHeader;
