# 🚀 SubFuzzerX — Cyborg Mass Fuzzer
SubFuzzerX is a powerful bash-based fuzzing tool built for bug bounty hunters, red teamers, and OSINT researchers. It takes a list of live subdomains and fuzzes them with a custom wordlist to uncover sensitive files, hidden directories, and potential information disclosures.

🔍 Made with ❤️ by Riya Nair

# 💡 What It Does
✅ Takes live subdomains as input
✅ Filters only those responding with HTTP 200/3xx/4xx
✅ Fuzzes each domain with your wordlist (e.g. .git, .env, config.php)
✅ Saves all valid hits into clean output files

#📦 Requirements
Make sure you have the following tools installed:

-httpx
-ffuf
-bash (Linux/macOS terminal)

Install via:
go install github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/ffuf/ffuf/v2@latest

#⚙️ Usage

chmod +x cyborgfuzz.sh
./cyborgfuzz.sh -l livesubs.txt -w wordlists.txt
-l: File containing list of live subdomains (one per line)

-w: Your custom wordlist of sensitive paths

Example:
./cyborgfuzz.sh -l subdomains.txt -w wordlists.txt

#📝 Output
Results are saved automatically:
✅ output1.txt, output2.txt, … → full URL paths with matches
✅ Cleaned HTTP logs in results/
✅ Only URLs with valid responses like 200, 302, 403, etc. are fuzzed

Note : You can modify or expand this wordlist anytime or even use any wordlists you prefer. 

📚 Author
👩‍💻 Riya Nair — Cybersecurity Researcher
Follow for more tools and security content.
