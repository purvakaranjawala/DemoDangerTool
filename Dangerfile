require 'pry'

# Sometimes it's a README fix, or something like that - which isn't relevant for
# including in a project's CHANGELOG for example
declared_trivial = github.pr_title.include? "#trivial"

# Make it more obvious that a PR is a work in progress and shouldn't be merged yet
warn("PR is classed as Work in Progress") if github.pr_title.include? "[WIP]"

# Warn when there is a big PR
warn("Big PR") if git.lines_of_code > 500

# Don't let testing shortcuts get into master by accident
fail("fdescribe left in tests") if `grep -r fdescribe specs/ `.length > 1
fail("fit left in tests") if `grep -r fit specs/ `.length > 1

# Define a custom message
message = 'Please include a summary in your pull request description.'

# Check if the pull request description includes a summary
if github.pr_body.include?('# Summary')
  message 'PR includes summary'
else
  fail message
end

files = (git.modified_files + git.added_files).uniq
rubocop.lint files
github.dismiss_out_of_range_messages
rubocop.lint inline_comment: true
rubocop.lint rubocop_cmd: 'standardrb'

