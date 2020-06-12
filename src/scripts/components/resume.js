const componentSelector = '#resume';

import ResumeItem from "./resumeItem.js";

class Resume extends React.Component {
  constructor(props) {
    super(props);
  }

  state = {
    loading: true,
    sections: []
  };

  componentDidMount() {
    this._getResumeSections();
  }

  _getResumeSections = () => {
    axios.get('/api/resume').then(response => {
      this.setState({
        sections: response.data.sections
      });
    })
  };

  _renderSection = (section) => {
    return (
      <div>
        <p>{section.title}</p>
        <div>
          {section.entries.map(entry => {
            return (
              <ResumeItem content={entry} />
            );
          })}
        </div>
        <hr />
      </div>
    );
  }

  render() {
    const { sections } = this.state;
    return (
      <div>
        {sections.map(this._renderSection)}
      </div>
    );
  }
}

ReactDOM.render(React.createElement(Resume), document.querySelector(componentSelector));