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
    const sectionKey = Math.random();
    return (
      <div key={sectionKey} className='resumeSection'>
        <h3>{section.title}</h3>
        <div>
          {section.entries.map((entry, index) => {
            return (
              <ResumeItem key={`${sectionKey}-${index}`} content={entry} />
            );
          })}
        </div>
      </div>
    );
  }

  render() {
    const { sections } = this.state;
    return (
      <div className='resume'>
        {sections.map(this._renderSection)}
      </div>
    );
  }
}

ReactDOM.render(React.createElement(Resume), document.querySelector(componentSelector));