import React from 'react';

class MessageButton extends React.Component {
  constructor(props) {
    super(props);
    this.state = {sendMessage: false, body: ""};
    this.displayMessageForm = this.displayMessageForm.bind(this);
    this.cancelMessage = this.cancelMessage.bind(this);
    this.keyDown = this.keyDown.bind(this);
    this.updateMessage = this.updateMessage.bind(this);
    this.handleSend = this.handleSend.bind(this);
  }

  displayMessageForm() {
    this.setState({sendMessage: true});
  }

  cancelMessage() {
    this.setState({
      sendMessage: false
    });
  }

  keyDown(e) {
    if (e.key === "Escape") {
      this.cancelMessage();
    }
  }

  updateMessage(e) {
    this.setState({body: e.target.value});
  }

  handleSend() {
    this.props.sendMessage({
      body: this.state.body,
      recipient_id: this.props.profile.user_id
    }).then(
      () => this.setState({sendMessage: false, body: ""})
    );
  }

  render() {
    console.log(this.props);
    let messageForm;
    if (this.state.sendMessage) {
      messageForm = (
        <div onKeyDown={this.keyDown}>
          <div
            className="add-shadow"
            onClick={this.cancelMessage}
            ></div>
          <div className="foreground-message-box">
            <form>
              <textarea
                value={this.state.body}
                className="update-textarea"
                onChange={this.updateMessage}
                autoFocus={true}
                ></textarea>
            </form>
            <button
              onClick={this.handleSend}
              className="submit-response-button"
              >Send</button>
          </div>
        </div>

      );
    }

    return (
      <div className="message-button-position">
        <button
          className="message-button"
          onClick={this.displayMessageForm}
          >
          <i className="fas fa-comment"></i> Message
        </button>
        {messageForm}
      </div>
    );
  }
}

export default MessageButton;
