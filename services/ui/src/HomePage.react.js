// @flow

import * as React from "react";

import {
    Page,
    Avatar,
    Icon,
    Grid,
    Card,
    Text,
    Table,
    Alert,
    Progress,
    colors,
    Dropdown,
    Button,
    StampCard,
    StatsCard,
    ProgressCard,
    Badge, Form,
} from "tabler-react";

import C3Chart from "react-c3js";

import SiteWrapper from "./SiteWrapper.react";
import ComponentDemo from "./ComponentDemo";

function Home() {
    return (
        <SiteWrapper>
            <Page.Content title="News Aggregator">

                <Form.Group label="Select source">
                    <Form.Select>
                        <option>United Kingdom</option>
                        <option>Germany</option>
                    </Form.Select>
                </Form.Group>

                <Grid.Row cards={true}>
                    <Card
                        title="This is a standard card"
                        isCollapsible
                        body="Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                        Aperiam deleniti fugit incidunt, iste, itaque minima neque
                        pariatur perferendis sed suscipit velit vitae voluptatem. A
                        consequuntur, deserunt eaque error nulla temporibus!"
                        footer="This is standard card footer"
                    />
                </Grid.Row>
            </Page.Content>
        </SiteWrapper>
    );
}

export default Home;
