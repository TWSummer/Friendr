import React from 'react';
import { Link } from 'react-router-dom';

class MessageIndexItem extends React.Component {
  constructor(props) {
    super(props);
    this.state={
      show: false,
      messageBody: "",
      showErrors: false
    };
    this.getPreview = this.getPreview.bind(this);
    this.getTimestamp = this.getTimestamp.bind(this);
    this.showConversation = this.showConversation.bind(this);
    this.messageTime = this.messageTime.bind(this);
    this.cancelMessage = this.cancelMessage.bind(this);
    this.sendMessage = this.sendMessage.bind(this);
    this.updateMessageBody = this.updateMessageBody.bind(this);
    this.formatText = this.formatText.bind(this);
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

  messageTime(message) {
    let timeStamp = message.created_at;
    timeStamp = new Date(timeStamp);
    return timeStamp.toLocaleDateString();
  }

  cancelMessage(e) {
    e.preventDefault();
    this.setState({show: false, messageBody: "", showErrors: false});
  }

  sendMessage(e) {
    e.preventDefault();
    this.props.sendMessage({
      body: this.state.messageBody,
      recipient_id: this.props.conversation[0].sender_id === this.props.session.currentUser.id ?
        this.props.conversation[0].recipient_id :
        this.props.conversation[0].sender_id
    }).then(
      () => this.setState({messageBody: "", showErrors: false}),
      () => this.setState({showErrors: true})
    );
  }

  updateMessageBody(e) {
    this.setState({messageBody: e.target.value});
  }

  formatText(text) {
    if (text===null) {
      return null;
    } else {
      return text.split('\n').map((item, i) => {
        return <p key={i}>{item}<br/></p>;
        });
    }
  }

  conversationItemContents() {
    if (this.state.show) {
      return (
        <main className="conversation-item-extended">
          <section className="past-message-section">
            <div className="messages-scroll-area">
              {
                this.props.conversation.map( (message, idx) => {
                  return (
                    message.sender_id === this.props.session.currentUser.id ?
                    <div key={idx}>
                      <h3 className="message-timestamp">
                        {this.messageTime(message)}
                      </h3>
                      <div className="my-message">
                        <h4>{this.formatText(message.body)}</h4>
                        <img src={this.props.session.currentUser.primary_img_url} />
                      </div>
                    </div>
                    :
                    <div key={idx}>
                      <h3 className="message-timestamp">
                        {this.messageTime(message)}
                      </h3>
                      <div className="their-message">
                        <img src={message.other_user.primary_img_url} />
                        <h4>{this.formatText(message.body)}</h4>
                      </div>
                    </div>
                  );
                })
              }
            </div>
          </section>
          {
            this.state.showErrors ?
            <ul>
              {
                this.props.errors.map( (error, idx) => (
                  <li className="message-errors" key={idx}>{error}</li>
                ))
              }
            </ul>
            : ""
          }
          <form className="message-reply-form">
            <textarea
              placeholder="Write them a message"
              value={this.state.messageBody}
              onChange={this.updateMessageBody}
              ></textarea>
            <div className="message-form-buttons">
              <button
                className="send-message-button"
                onClick={this.sendMessage}
                >Send</button>
              <button
                className="cancel-message-button"
                onClick={this.cancelMessage}
                >Cancel</button>
            </div>
          </form>
        </main>
      );
    } else {
      return (
        <main
          className="conversation-item"
          onClick={this.showConversation}
          >
          <Link to={`/profile/${this.props.conversation[0].other_user.username}`} className="message-profile-link">
            <img src={this.props.conversation[0].other_user.primary_img_url}/>
            <div className="message-profile-image-overlay"></div>
          </Link>
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
