import React from 'react';

class viewProfileSectionItem extends React.Component {
  constructor(props) {
    super(props);
  }

  formatText(text) {
    return text.split('\n').map((item, i) => {
      return <p>{item}<br/></p>;
    });
  }

  render() {
    return (
      <article className="profile-section-item">
        <div>
          <p className="response-text">
            {
              this.props.profile[this.props.type] ?
              this.formatText(this.props.profile[this.props.type]) :
              "I haven't written anything yet!"
            }
          </p>
        </div>
      </article>
    );
  }
}

export default viewProfileSectionItem;
