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
    <td align="center" style="white-space:pre-wrap; word-wrap:break-word">Ollama<br>+<br>Open WebUI</td>
    <td align="center" style="white-space:pre-wrap; word-wrap:break-word">Functional<br>Testing</td>
    <td style="white-space:pre-wrap; word-wrap:break-word">*  Installs, GPU recognized with Ipex/oneAPI.<br>*  Testing is ongoing.</td>
  </tr>
  <tr>
    <td align="center" style="white-space:pre-wrap; word-wrap:break-word">CrewAI</td>
    <td align="center" style="white-space:pre-wrap; word-wrap:break-word">WIP<br>Testing</td>
    <td style="white-space:pre-wrap; word-wrap:break-word">*  Could not use crewai[tools] due to package conflicts, but standard version installs without error<br>*  Testing is ongoing.</td>
  </tr>
    <tr>
    <td align="center" style="white-space:pre-wrap; word-wrap:break-word">Fooocus</td>
    <td align="center" style="white-space:pre-wrap; word-wrap:break-word">Functioning<br>Well</td>
    <td style="white-space:pre-wrap; word-wrap:break-word">*  Installs, opens in browser, and generates images using the GPU (xpu).<br>*  I am currently working on adding API for use with ollama/Open WebUI.<br>*  I have a working <a href="https://github.com/JT-Gresham/Fooocus-IntelArc-ArchLinux">standalone</a>. I will leave it up for the time being.</td>
  </tr>
    <tr>
    <td align="center" style="white-space:pre-wrap; word-wrap:break-word">Forge<br>(Automatic 1111)</td>
    <td align="center" style="white-space:pre-wrap; word-wrap:break-word">Functional-ish</td>
    <td style="white-space:pre-wrap; word-wrap:break-word">*  I've successfully gotten it working and making images but seems slow.<br>*  Testing is ongoing beyond that.</td>
  </tr>
  <tr>
    <td align="center" style="white-space:pre-wrap; word-wrap:break-word">Automatic 1111<br>(stable-diffusion-webui)</td>
    <td align="center" style="white-space:pre-wrap; word-wrap:break-word">WIP</td>
    <td style="white-space:pre-wrap; word-wrap:break-word">I have a working <a href="https://github.com/JT-Gresham/Auto1111-IntelArc-ArchLinux">standalone</a>. Currently attempting to modify for AIIAAL.</td>
  </tr>
  <tr>
    <td align="center" style="white-space:pre-wrap; word-wrap:break-word">Roop<br>Unleashed</td>
    <td align="center" style="white-space:pre-wrap; word-wrap:break-word">WIP</td>
    <td style="white-space:pre-wrap; word-wrap:break-word">I have a working <a href="https://github.com/JT-Gresham/roopUL-IntelArc-ArchLinux">standalone</a>. Currently attempting to modify for AIIAAL.</td>
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
*    SOME packages, like FORGE, may shutdown after the first run. That's not my doing, but it seems that those packages need to create their own configs. Run your launcher again afterward and it should load up.
*    SOME packages may throw out some python package version mismatch errors during installation, but I've found that they don't seem to have an impact and can be ignored.
*    This framework is HEAVILY reliant on a few packages released by Intel (Ipex, Intel-Extension-For-Pytorch, etc...) and we are all limited to their progress at this point.  Keep that in mind going forward.
  
