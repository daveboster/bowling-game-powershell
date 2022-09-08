# bowling-game-powershell
Bowling game example implemented with PowerShell and the Pester TDD framework.

Testing

[![Test PowerShell on Ubuntu](https://github.com/daveboster/azure-powershell/actions/workflows/powershell-actions.yml/badge.svg)](https://github.com/daveboster/azure-powershell/actions/workflows/powershell-actions.yml)

## CI/CD for PowerShell
How can we do a CI/CD for PowerShell scripts?

Path: `./github-actions'
* Testing whether we can use GitHub actions to test


## Installation 

### Prerequisites - MacOS
1. Install PowerShell via Homebrew `brew install --cask powershell`

### Prerequisites - Windows 10
1. Uninstall the built-in version of Pester using [Pester Installation](https://pester.dev/docs/introduction/installation).

### Install Pester
1. Install Pester module locally using `Install-Module Pester -Force`.
1. Run the command `Import-Module Pester -PassThru` and you should see it return.

### VSCode Extension
- Pester Test Explorer
- Pester Tests

### Adding Pester Tests
From the [Pester QuickStart](https://pester.dev/docs/quick-start)
1. Review initial test file (using Get-Planet function) in the Sample-Test directory.
1. From PowerShell run `Invoke-Pester` or use VSCode Test Explorer.


### Resources
- [GitHub - Automating and Testing PowerShell](https://docs.github.com/en/actions/automating-builds-and-tests/building-and-testing-powershell)
- [Pester QuickStart](https://pester.dev/docs/quick-start)

### Backlog