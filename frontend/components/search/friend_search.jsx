import React from 'react';

class FriendSearch extends React.Component {
  constructor(props) {
    super(props);
    this.state = this.props.profile;
  }

  render() {

    return (
      <div>
        <header>
          This is the search bar
        </header>
      </div>
    );
  }
}

export default FriendSearch;
