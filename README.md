# Vio.com Engineering Platform Tech Lead Assignment

## Introduction

This assignment is part of the recruitment process for the Engineering Platform Tech Lead at Vio.com. The purpose is to assess the technical skills of the candidates in a generic scenario.

> **_NOTE_**: Please, read carefully all the instructions before starting to work on your solution and feel free to contact us if you have any questions.

## Assignment

### Scenario

You are working on a platform team and have developed a Terraform module that helps your customer deploy some infrastructure. The module is a success; all teams are using it, and you have achieved your goal.

However, customers also need to maintain the Terraform code that calls this module and configure a Terraform backend (main.tf). You notice that most customers just copy and paste the main.tf file and don't really care about it. Besides, as you don't control the code that calls your module, you have a hard time maintaining it since any change to the module interface has to be applied in multiple places.

You realize that it would be better to have a simple configuration file and a command line that would deploy the resource, abstract the complexity away from the users, and make maintenance more manageable for you.

### Goal

You will build a CLI tool that streamlines the module's use by exposing users to a simple, easy-to-use interface. Users will interact only with the CLI and a configuration file. 

Under the hood, the CLI will generate the boilerplate (main.tf) and call Terraform on it. The CLI should support three main commands: init, plan, and apply. 

The CLI should be a single fat binary, so it should be straightforward for users to install the CLI tool. The only external dependency that is allowed is Terraform itself.

### Nice To Have

It would be nice to implement support for multiple environments and to allow default values when prompting questions in the init command.

### Implementation

In this repository you have an `examples` folder, with the `main.tf` that you must use as start point to the generated files and the module that will be used, at the root of the repository.

Your CLI should be able to generate a `main.tf` like the one from `examples` in the `src` directory, but replacing values in the file with the ones informed by the users.

Your CLI should also be able to run terraform plan and apply in the generated file.

#### init

On the init command, you will prompt users with a few questions, and the answers will be stored in a configuration file using whatever format you prefer. The configuration file should be stored at `src/system-name`, where system-name comes from one of the questions prompted by the CLI tool.

During the prompt, you will need to ask users questions that you will later use to generate the main.tf file. You can see the questions you must ask by looking for values with `REPLACE-ME` in the `main.tf` file.

#### plan

You need to read the configuration file and generate the main.tf file, which calls the Terraform module and configures the backend. Then, run the Terraform plan on the generated file. The generated file will be stored in the `src/systems-name/.cache` folder. You can use whatever method to generate the `main.tf` file.

#### apply

On the apply command, you will do the same as the plan command, but use apply instead.

## Tips

- You can use any language you prefer, although we recommend Go lang as it's the language used by our team.
- Users experience is very important focus on that and if possible document how users can use the tool.
- Provide clear instructions on one can build and run your solution.

## Submission

The assignment should be submitted using your own GitHub repository. You should provide the source code, with a detailed README on how to use the solution.

> **_NOTE_**: Keep the GH repository private, the Recruiter will send you a list of users to allow access.
