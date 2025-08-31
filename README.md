# Linux CLI Treasure Hunt – Instructions

## Objective

Navigate through multiple folders and ZIP files, solve questions, collect letters, and reconstruct the final hidden phrase.

Each ZIP file is password-protected with the **answer to the previous question**. You will collect letters from each ZIP by **reading the README file** inside, which will reveal the letter for that step.

---

## Setup

1. **Download and extract** the ZIP package (`linux_treasure_hunt.zip`) to a folder accessible on your VM.

2. Open a terminal and `cd` into the starting folder:

```bash
cd path/to/start_here
```

3. Make sure `unzip` is installed (required to open password-protected ZIPs):

```bash
sudo apt update
sudo apt install unzip -y
```

4. Use `ls` to see the first clue file and the first treasure:

```bash
ls
# You should see: clue.txt  treasure1.zip
```

---

## Step-by-Step Walkthrough

### Step 1: Read the first clue

```bash
cat clue.txt
```

* The clue will ask a Linux CLI question, e.g., **"What command lists files in long format?"**
* The answer is the **password** for `treasure1.zip`.

---

### Step 2: Open the treasure

```bash
unzip -P <answer_password> treasure1.zip
```

* Replace `<answer_password>` with the correct Linux command (e.g., `ls -l`).
* Inside the ZIP, you will find:

  * `README.txt` – contains instructions and **the letter** for this step

---

### Step 3: Get the letter

* Open the README file to see the letter:

```bash
cat README.txt
```

* The README may also contain instructions to execute a small shell script to reveal the letter:

```bash
chmod +x show_letter.sh
./show_letter.sh
```

* Append the letter to your collection:

```bash
echo "<letter>" >> CollectedLetters.txt
```

> **Important:** You must read the README and collect the letter before proceeding to the next step.

---

### Step 4: Move to the next folder

* Use `cd` to enter the next folder:

```bash
cd path/to/next_folder
```

* Repeat the process: read `clue.txt`, use the answer as the ZIP password, unzip the treasure, read the README (or execute the script) to get the letter, and append it to `CollectedLetters.txt`.

* Each folder contains **only two files**:

  * `clue.txt` – contains the question
  * `treasureX.zip` – contains the letter (via README)

* To go back to the previous folder if needed:

```bash
cd ..
```

---

## Commands You Will Be Using

| Purpose                            | Commands                                              |
| ---------------------------------- | ----------------------------------------------------- |
| Change directory                   | `cd folder_name`                                      |
| List files in a directory          | `ls`, `ls -l`, `ls -a`                                |
| Print current working directory    | `pwd`                                                 |
| Check current user                 | `whoami`                                              |
| Disk usage                         | `du`, `df`                                            |
| Display date/time                  | `date`                                                |
| Copy files/directories             | `cp file1 file2`                                      |
| Move/rename files/directories      | `mv oldname newname`                                  |
| Remove files                       | `rm filename`                                         |
| Count words/lines/characters       | `wc file.txt`                                         |
| View running processes             | `ps`, `top`                                           |
| Display first/last lines of a file | `head file.txt`, `tail file.txt`                      |
| Search for patterns                | `grep pattern file.txt`                               |
| Display or set variables           | `echo $VARIABLE`                                      |
| Clear terminal screen              | `clear`                                               |
| Unzip password-protected files     | `unzip -P <password> file.zip`                        |
| Make shell scripts executable      | `chmod +x show_letter.sh`                             |
| Execute shell scripts              | `./show_letter.sh`                                    |
| Append content to a file           | `>>`, e.g., `echo "<letter>" >> CollectedLetters.txt` |
| Read the letter                    | `cat README`                                      |

---

## Final Step

* After all steps, your `CollectedLetters.txt` will contain all scrambled letters.
* Rearrange them to discover the hidden phrase.

---

## Hints

* Always use `cd` to move between folders.
* Use `ls` with options (`-l`, `-a`) to find hidden clues.
* Use `cat`, `less`, or `more` to read text files.
* Check your current location with `pwd` before moving.
* Go back to the previous directory with `cd ..`.
* **Always read the README** in each treasure ZIP to get the letter before moving to the next step.

## Submission
* Submit the generated file {username}_treasure_hunt.zip
