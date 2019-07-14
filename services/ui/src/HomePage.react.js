import React from "react";

import { Card, Form, Grid, Page, } from "tabler-react";

import SiteWrapper from "./SiteWrapper.react";
import axios from 'axios';

export default class Home extends React.Component {

  state = {
    sources: [],
    articles: [],
    sourceKey: ''
  };

  componentDidMount() {
    console.log(process.env.REACT_APP_SOURCE_HOST);
    console.log(process.env.REACT_APP_ARTICLE_HOST);
    axios.get(process.env.REACT_APP_SOURCE_HOST)
      .then(res => {
        const sources = res.data.sources;
        this.setState({ sources });
      });
  }

  getArticlesForSource = (event) => {
    axios.get(process.env.REACT_APP_ARTICLE_HOST + '?sources=' + event.target.value)
      .then(res => {
        const articles = res.data.articles;
        this.setState({ articles });
      });
  }

  render() {
    return (
      <SiteWrapper>
        <Page.Content title="News Aggregator">

          <Form.Group label="Select source">
            <Form.Select
              onChange={this.getArticlesForSource}
            >
              {this.state.sources.map((item) => {
                return (
                  <option key={item.id} value={item.id}>{item.name}</option>
                );
              }
              )}
            </Form.Select>
          </Form.Group>

          <Grid.Row cards={true}>
            {this.state.articles.map((item) => {
              return (
                <Card
                  title={item.title}
                  isCollapsible
                  body={item.description}
                  footer={item.author}
                />
              );
            }
            )}

          </Grid.Row>
        </Page.Content>
      </SiteWrapper>
    )
  };
}
