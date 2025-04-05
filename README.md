# adityabanerjee.me

## Overview

This is the new version of my personal website, built with SvelteKit and DrizzleORM.

## Design

The Figma design for the website can be seen below:

![Design](/static/figma.svg)

Alternatively, you can view the design in Figma [here](https://www.figma.com/design/eWuHhbiW1oJZITC2U2gQyv/New-Portfolio-Site-Design?node-id=0-1&t=NHXDb6ojz7Ztvqwh-1).

## Roadmap

### Version 1.0

- [x] Complete landing page
- [x] Complete about page
- [x] Complete timeline page
- [x] Complete projects page
- [x] Complete acknowledgements page

### Version 1.1

- [x] Add timeline item modals
- [x] Add projects item modals
- [x] Add blog page
- [x] Add content management system

### Version 1.2

- [x] Add admin dashboard
- [ ] Add toast notifications
- [ ] Add blog post categories
- [ ] Add blog post search and filter

### Version 2.0

- [ ] Replace about page prompt answers with RAG based response

## Temporary Notes

- Need to optimise infra costs. The current setup is well-architected but the costs are too high.
- Can consider the following architecture:

  ```
  Always Running:
  - ECS Task in private subnet
  - RDS
  - S3
  - VPC Endpoints for API Gateway/Lambda

  On-Demand (when writing):
  + ALB
  + NAT Gateway
  ```
