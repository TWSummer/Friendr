import React from 'react';

class viewProfileAside extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {

    return (
      <aside className="profile-aside">
        <b>Gender</b><br />
          <div className="gender-view">
            {this.props.profile.gender}
          </div>
      </aside>
    );
  }
}

export default viewProfileAside;
