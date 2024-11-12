# dbt Meetup Containerized Deployment

Welcome to the dbt Meetup Containerized Deployment project!

### Overview

This project provides a containerized setup for deploying dbt (data build tool) projects, making it easier to manage dependencies and ensure consistency across different environments.

### Getting Started

To get started with this project, follow these steps:

1. **Build the Docker image:**
    ```sh
    docker build -t dbt_meetup .
    ```

2. **Run the Docker container:**
    ```sh
    docker run -it --rm dbt_meetup
    ```

3. **Execute dbt commands inside the container:**
    ```sh
    dbt run
    dbt test
    ```

### Resources

- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

### Contributing

We welcome contributions to improve this project. Please submit issues or pull requests on the [GitHub repository](https://github.com/your-repo/dbt_meetup_containerized_deployment).

### License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
