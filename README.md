windows-selenium-dev-setup
==========================

**This repository is no longer necessary!**

The same effect can be achieved by using [Chocolatey](https://chocolatey.org). The 
current contents of this repo will now consist of only a command-line script that
installs Chocolatey, and uses it to install the appropriate packages. To use the
script, execute it from with an elevated ("Run as Administrator) command prompt.

Purpose
-------
This repository provides a simple script for installing all packages on a Windows
machine to allow for development of Selenium. It will install the following items:

* Git
* Python 2.x
* Ruby
* Java Development Kit
* .NET Framework 3.5
* .NET Framework 4.0 (installed as a prerequisite for Chocolatey)

Usage
-----
`go [addvs]`

The optional `addvs` parameter will also install Visual Studio Community Edition, 
if the parameter is present.