# AI-IntelArc-ArchLinux
Master repository for AIIAAL - A one-stop framework for popular AI related software for **Arch Linux** users with **Intel Arc GPUs**.  

# How You Can Support Development  

[<img align="left" width="20%" src="https://media.giphy.com/media/hXMGQqJFlIQMOjpsKC/giphy.gif">](https://bmc.link/OCD_Insomniac)  

*    Please consider supporting me with [Buy Me A Coffee](https://bmc.link/OCD_Insomniac)!
*    Get the buzz out by reviewing and sharing on social networks like Facebook, Twitter (formerly), etc...
*    Consider purchasing something from the [Amazon wishlist](https://www.amazon.com/hz/wishlist/ls/25OBUY6VTN1C8?ref_=wl_share)...items I always need more of. (Mouses, Keyboards, Storage, etc...)
*    [<img align="left" width="10%" src="https://m.media-amazon.com/images/I/41CMZ4XoAJL._SS135_.jpg">](https://www.amazon.com/hz/wishlist/ls/25OBUY6VTN1C8?ref_=wl_share) [<img align="left" width="10%" src="https://i.etsystatic.com/49605844/r/il/d7369b/5752403283/il_640xN.5752403283_m6wa.jpg">](https://www.etsy.com/shop/JTGreshamExclusives)
<br clear="left"/>

# Features
Features installers and creates launchers for:
  
<table>
  <tr>
    <th>AI Software</th>
    <th>Status</th>
    <th>Development Phase Notes</th>
  </tr>
  <tr>
    <td>Ollama with Open WebUI</td>
    <td align="center">WIP Testing</td>
    <td>Installs, server starts, and UI opens in browser without error. Testing is ongoing.</td>
  </tr>
  <tr>
    <td>CrewAI</td>
    <td align="center">WIP Testing</td>
    <td>Could not use crewai[tools] due to package conflicts, but standard version installs without error. Testing is ongoing.</td>
  </tr>
    <tr>
    <td>Fooocus</td>
    <td align="center">WIP</td>
    <td>I have a working <a href="https://github.com/JT-Gresham/Fooocus-IntelArc-ArchLinux">standalone</a>. Currently attempting to modify for AIIAAL.</td>
  </tr>
  <tr>
    <td>Automatic 1111 (stable-diffusion-webui)</td>
    <td align="center">WIP</td>
    <td>I have a working <a href="https://github.com/JT-Gresham/Auto1111-IntelArc-ArchLinux">standalone</a>. Currently attempting to modify for AIIAAL.</td>
  </tr>
  <tr>
    <td>Roop Unleashed</td>
    <td align="center">WIP</td>
    <td>I have a working <a href="https://github.com/JT-Gresham/roopUL-IntelArc-ArchLinux">standalone</a>. Currently attempting to modify for AIIAAL.</td>
  </tr>
</table> 
  
# REQUIREMENTS
This framework assumes that you have these already installed:
*    Arch Linux based OS - Duh...
*    Intel Arc GPU - Duh...
*    The latest Intel Arc GPU drivers
*    Python 3.11 (can be found in the AUR as 'python311')
  
# Installation Is Easy
Simply run (as a standard user, not root) the installation bash file (ex: AIIAAL-install.sh, AIIAAL-install-ollama.sh, etc...) for the package you want to install.  Yeah...it's that easy!
*    Note: [AIIAAL needs to be already installed](https://github.com/JT-Gresham/AI-IntelArc-ArchLinux/blob/main/AIIAAL-install.sh) before using the other installers. AIIAAL is the framework the others are built on. You only need to install the framework (AIIAAL) once.
  
