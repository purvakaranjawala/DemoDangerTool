# README

* Ruby version 3.1.2

* Rails version 7

This Repo is for showing working for the Danger Tool(https://danger.systems/guides/getting_started.html):-

It is a tool that allows to automate parts of code review process by running custom checks(checks that are specific to project.) on pull requests.
For Example if migration is added in PR so it will need to run rails db:migrate so remainder message can be added.

Setup of Danger Tool can be done using CI Tool and direct from GitHub account.

Here set up is done from Github account.

Steps Followed:- 

1. Add the **danger** gem to your Gemfile and run **bundle install** to install it.
2. Run **bundle exec danger** init to generate a **Dangerfile** in the root of your repository.
3. Configure the Dangerfile to suit your needs. This can include setting up rules for code style, linting, and testing, as well as defining custom rules.
    ![Screenshot from 2023-03-09 15-56-43](https://user-images.githubusercontent.com/116082151/223996478-6036f1a5-36a6-460e-9262-a03524730a96.png)
4. Commit the Dangerfile to your repository(or create a new repo on git for new project)
5. Now In your GitHub repository, go to the "Settings" tab and click on "Actions". Search for danger-action 
6. Create a new workflow file, such as .github/workflows/danger.yml, and add the following code:

     ![Screenshot from 2023-03-09 15-50-52](https://user-images.githubusercontent.com/116082151/223997274-114fcd10-5a09-4c9c-9372-0d7a8ba1f3f8.png)
   
   This workflow will run Danger on every pull request, using the latest version of Ubuntu and Ruby 3.1.2.
   Examples for configuration available here: https://github.com/marketplace/actions/danger-action
   
   > Note: ruby-version can be changed to match your project's requirements.
      
7. Commit the workflow file to your repository.

Now, when a pull request is opened, GitHub Actions will automatically run Danger and report any issues found in the pull request.

# Danger Needs token
  The GitHub token is used to authenticate with the GitHub API and perform actions such as commenting on pull requests, creating issues, and updating labels. Without a valid token, Danger will not be able to interact with your GitHub repository.
  
  1. When danger init command is ran it provides a link to generate a github token: https://github.com/settings/tokens/new
  2. Give your token a descriptive name (e.g. "Danger Bot").
  3. Under "Select scopes", check the boxes for "repo" and "read:org".
  4. Click on the "Generate token" button at the bottom of the page.
  5. Copy *Generated token* 
  6. Go to your GitHub repository and click on the "Settings" tab.
  7. Click on "Secrets" in the sidebar.
  8. Click on the "New repository secret" button.
  9. Enter **DANGER_GITHUB_API_TOKEN** as the name of the secret.
  10. Paste the *token* into the value field of the secret.
  11. Save the secret
     
     Now we can use **${{ secrets.DANGER_GITHUB_API_TOKEN }}** in your GitHub Actions workflow or Dangerfile to authenticate with the GitHub API.
     Note:- that we should treat this token as a secret and keep it safe, as it grants full access to your GitHub repositories.
     
     
  
