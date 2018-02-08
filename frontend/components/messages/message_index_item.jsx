import React from 'react';

class MessageIndexItem extends React.Component {
  constructor(props) {
    super(props);
    this.state={
      show: false
    };
    this.getPreview = this.getPreview.bind(this);
    this.getTimestamp = this.getTimestamp.bind(this);
    this.showConversation = this.showConversation.bind(this);
  }

  getPreview() {
    let lastMessage = this.props.conversation[this.props.conversation.length - 1].body;
    if (lastMessage.length < 150) {
      return lastMessage;
    } else {
      return lastMessage.slice(0, 149) + "...";
    }
  }

  getTimestamp() {
    let timeStamp = this.props.conversation[this.props.conversation.length - 1].created_at;
    timeStamp = new Date(timeStamp);
    return timeStamp.toLocaleDateString();
  }

  showConversation() {
    this.setState({show: true});
  }

  conversationItemContents() {
    if (this.state.show) {
      return (
        <main className="conversation-item">

        </main>
      )
    } else {
      return (
        <main
          className="conversation-item"
          onClick={this.showConversation}
          >
          <img src={this.props.conversation[0].other_user.primary_img_url}/>
          <div>
            <h2>{this.props.conversation[0].other_user.name}</h2>
            <p>{this.getPreview()}</p>
          </div>
          <h5>{this.getTimestamp()}</h5>
        </main>
      );
    }
  }

  render() {
    return (
      this.conversationItemContents()
    );
  }
}

export default MessageIndexItem;
