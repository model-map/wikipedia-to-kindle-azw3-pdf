# Wikipedia-to-kindle-epub-pdf

A bash script to send wikipedia articles to kindle as EPUB. Also downloads the pdf to your current directory.

# Usage

<sup>(Note: If you only want to download wikipedia articles as pdf and don't care about sending them to your kindle, skip step 1,2,3,4 and go directly to step 5.)</sup><br><br>
Before we can begin executing the script we need to make a few changes on our end.<br>

1. <b>Get [Google app password](https://support.google.com/accounts/answer/185833?hl=en)</b><br>
   This is required for Google to allow your app to send mail via its smtp server.<br>
   Since we're sending mail to your kindle, please make sure the email address is in kindle's approved email list.

   <sup>(Note: The following guide follows Gmail configuration. If you're using another email provider, please lookup their smtp configuration)<br><br></sup>

2. <b>Open '/etc/ssmtp/ssmtp.conf' and add the following entry:</b>
   <br>
   (Create the dir and file if they don't exist.)

```
UseSTARTTLS=YES
FromLineOverride=YES
root=admin@example.com
mailhub=smtp.gmail.com:587
AuthUser=username@gmail.com
AuthPass=password
```

Replace AuthUser and Authpass with your kindle-approved gmail and app-password respectively.

3. <b>Installing ssmtp and mpack</b>
   <br>On ubuntu:

```
sudo apt-get install ssmtp
sudo apt-get install mpack
```

4.  <b>There are two methods to use the script.</b>
    <br>

    4.1. executing the bash script
    <br>
    4.2. setting alias in ~/.bashrc

    - <b>Executing bash script</b>
      <br>

      - Download `wikipedia-to-epub.sh` file from the github repo
      - `chmod +x ./wikipedia-to-epub.sh`
      - use by executing `./wikipedia-to-epub.sh [article-name]` for example `./wikipedia-to-epub.sh computer_science`

    - <b>Setting alias in ~/.bashrc</b>

      - `nano ~/.bashrc`
      - Add `alias [alias]='function _wikipdf() { wget "en.wikipedia.org/api/rest_v1/page/pdf/$1" && mv ./$1 ./$1.pdf && mpack -s "convert" -a ./$1.pdf [mail]@kindle.com; }; _wikipdf'` <br>Replace [alias] with a suitable alias and [mail] with your kindle email.

      <br>
         (I personally recommend 4.2. since it allows the command to be executed from anywhere as opposed to the script method.)<br><br>

5.  <b>Optionally if you only want to download wikipedia articles as pdf</b> without wanting to send it to kindle you could set<br> `alias [alias]='function _wikipdf() { wget "en.wikipedia.org/api/rest_v1/page/pdf/$1" && mv ./$1 ./$1.pdf; }; _wikipdf'` to your ~/.bashrc.<br>
    You don't need to follow

# Contribution

The script has only been tested on Ubuntu 22.04LTS so far (since that is the one I have). <br>
If you'd like, you can contribute by adding instructions for other distros and even other operating systems! (Windows and Mac)
