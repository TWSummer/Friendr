import React from 'react';

class viewProfileSectionItem extends React.Component {
  constructor(props) {
    super(props);
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
    return (
      <article className="profile-section-item">
        <div>
          <div className="response-text">
            {
              this.props.profile[this.props.type] ?
              this.formatText(this.props.profile[this.props.type]) :
              "I haven't written anything yet!"
            }
          </div>
        </div>
      </article>
    );
  }
}

export default viewProfileSectionItem;
