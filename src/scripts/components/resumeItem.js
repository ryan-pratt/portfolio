export default class ResumeItem extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const { content } = this.props;
    return (
      <div>
        <div>{content.dates}</div>
        <div>
          <div>
            <h4>{content.title}</h4>
            <span>{content.company}, {content.location}</span>
          </div>
          <h5>{content.subtitle}</h5>
          <p>{content.description}</p>
        </div>
      </div>
    );
  }
}
