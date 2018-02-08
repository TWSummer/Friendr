import React from 'react';

class MessageIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.fetchMessages();
  }

  render() {
    console.log(this.props.messages);
    return (
      <div>
        Look out, here come the messages!
      </div>
    );
  }
}

export default MessageIndex;
