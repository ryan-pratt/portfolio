export default class ResumeItem extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const { content } = this.props;
    return (
      <div className='resumeItem'>
        <div className='datesColumn' dangerouslySetInnerHTML={{__html: content.dates}} />
        <div className='detailsColumn'>
          <div className='resumeItemHeader'>
            <h4>{content.title}</h4>
            <div>{content.organization} ({content.location})</div>
          </div>
          {content.subtitle && (<h5>{content.subtitle}</h5>)}
          {content.description && (<p>{content.description}</p>)}
        </div>
      </div>
    );
  }
}
