const componentSelector = '#blogs';

import BlogPost from "./blogPost.js";

class Blogs extends React.Component {
  constructor(props) {
    super(props);
  }

  state = {
    loading: true,
    posts: []
  };

  componentDidMount() {
    this._getBlogPosts();
  }

  _getBlogPosts = () => {
    axios.get('/api/blogs').then(response => {
      this.setState({
        posts: response.data
      });
    })
  };

  _renderPost = (post) => {
    return (
      <BlogPost key={post.id} content={post} />
    );
  }

  render() {
    const { posts } = this.state;
    return (
      <div className='blogs'>
        {posts.map(this._renderPost)}
      </div>
    );
  }
}

const element = document.querySelector(componentSelector);
if (element) ReactDOM.render(React.createElement(Blogs), element);