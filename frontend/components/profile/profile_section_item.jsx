import React from 'react';

class profileSectionItem extends React.Component {
  constructor(props) {
    super(props);
    this.state=this.props.profile;
    this.cancelEdit = this.cancelEdit.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.updateResponse = this.updateResponse.bind(this);
    this.keyDown = this.keyDown.bind(this);
  }

  componentWillReceiveProps(newProps) {
    if (this.props.user_id !== newProps.profile.user_id) {
      this.setState({
        id: newProps.profile.id,
        user_id: newProps.profile.user_id,
        [this.props.type]: newProps.profile[this.props.type]
      });
    }
  }

  showEdit() {
    this.setState({edit: true});
  }

  updateResponse(e) {
    this.setState({[this.props.type]: e.target.value});
  }

  handleSubmit(e) {
    this.props.updateProfile({
      id: this.state.id,
      user_id: this.state.user_id,
      [this.props.type]: this.state[this.props.type]
    })
      .then(
        () => this.setState({edit: false})
      );
  }

  cancelEdit() {
    this.setState({
      edit: false,
      [this.props.type]: this.props.profile[this.props.type]
    });
  }

  keyDown(e) {
    if (e.key === "Escape") {
      this.cancelEdit();
    }
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

  render() {
    let itemContents;
    if (this.state.edit) {
      itemContents = (
        <div onKeyDown={this.keyDown}>
          <div
            className="add-shadow"
            onClick={this.cancelEdit}
            ></div>
          <div className="foreground-box">
            <form>
              <textarea
                value={this.state[this.props.type]}
                className="update-textarea"
                onChange={this.updateResponse}
                autoFocus={true}
                ></textarea>
            </form>
            <button
              onClick={this.handleSubmit}
              className="submit-response-button"
              >Submit</button>
            <button
              onClick={this.cancelEdit}
              className="cancel-response-button"
              >Cancel</button>
          </div>
        </div>
      );
    }

    return (
      <article className="profile-section-item">
        {itemContents}
        <div>
          <div className="response-text">
            {this.formatText(this.state[this.props.type])}
          </div>
          <button
            className="edit-response-button"
            onClick={this.showEdit.bind(this)}>
            <i className="fas fa-pencil-alt"></i> Edit your response
          </button>
        </div>
      </article>
    );
  }
}

export default profileSectionItem;
