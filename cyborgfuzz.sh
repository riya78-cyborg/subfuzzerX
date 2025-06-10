#!/bin/bash

BLUE="\033[1;34m"
RESET="\033[0m"

print_banner() {
  echo -e "\n${BLUE}"
  echo "   ▄█████▄   ▄▄  ▄▄▄   ▄▄▄▄   ▄▄▄▄   ▄▄  ▄▄▄"
  echo "  ██▀──▀██ ▀▀ ▀▀▀██ ▀▀▀██▀ ▀▀▀██▀ ▀▀ ▀▀ ▀▀██"
  echo "  ██    ██ ▀▀   ▄██   ▄██     ██     ▀▀ ▄██"
  echo "  ▀██▄▄██▀ ██ ▄▀▀▀▀  ▄██▀    ▄██▀   ██ ▄██▀"
  echo "    ▀▀▀▀   ▀▀ ▀▀▀▀▀ ▀▀▀▀    ▀▀▀▀    ▀▀ ▀▀▀"
  echo "🔥 CYBORG MASS FUZZ — by Riya Nair"
  echo -e "${RESET}\n"
}

get_next_output_name() {
  i=1
  while [[ -f "output${i}.txt" ]]; do
    ((i++))
  done
  echo "output${i}.txt"
}

while getopts l:w: flag; do
  case "${flag}" in
    l) input_file=${OPTARG};;
    w) wordlist=${OPTARG};;
  esac
done

if [[ -z "$input_file" || -z "$wordlist" ]]; then
  echo "Usage: ./cyborgfuzz.sh -l livesubs.txt -w wordlist.txt"
  exit 1
fi

print_banner

output_file=$(get_next_output_name)
echo "[*] Output will be saved to: $output_file"
echo ""

echo "[*] Starting fuzzing..."
while IFS= read -r domain; do
  while IFS= read -r path; do
    full_url="${domain%/}/${path}"
    code=$(curl -sk -o /dev/null -w "%{http_code}" "$full_url")

    if [[ "$code" == "200" || "$code" == "403" || "$code" == "401" ]]; then
      echo "$full_url" >> "$output_file"
    fi
  done < "$wordlist"
done < "$input_file"

echo -e "\n✅ Fuzzing complete. Saved to: ${output_file}"
