import React from 'react';
import MessageIndexItem from './message_index_item';

class MessageIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.fetchMessages();
  }

  render() {
    return (
      <main className="messages-index">
        <header className="messages-header">
          <h1>
            <i className="fas fa-comments"></i> &nbsp;
            Conversations
          </h1>
        </header>
        <section>
          {
            this.props.messages.order.map((convoId) => {
              return (
                <MessageIndexItem
                  conversation={this.props.messages[convoId]}
                  key={convoId}
                  sendMessage={this.props.sendMessage}
                  session={this.props.session}
                  errors={this.props.errors}/>
              );
            })
          }
        </section>
      </main>
    );
  }
}

export default MessageIndex;
