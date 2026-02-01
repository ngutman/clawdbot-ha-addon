#!/usr/bin/env bash
set -euo pipefail

log() {
  printf "[addon] %s\n" "$*"
}

BASE_DIR=/config/openclaw
STATE_DIR="${BASE_DIR}/.openclaw"
REPO_DIR="${BASE_DIR}/openclaw-src"
LEGACY_BASE_DIR=/config/clawdbot

if [ -d "${LEGACY_BASE_DIR}" ] && [ ! -d "${BASE_DIR}" ]; then
  log "migrating storage ${LEGACY_BASE_DIR} -> ${BASE_DIR}"
  mv "${LEGACY_BASE_DIR}" "${BASE_DIR}"
elif [ -d "${LEGACY_BASE_DIR}" ] && [ -d "${BASE_DIR}" ]; then
  log "legacy storage ${LEGACY_BASE_DIR} detected; leaving it untouched"
fi

if [ -d "${BASE_DIR}/.clawdbot" ] && [ ! -d "${STATE_DIR}" ]; then
  log "renaming legacy state ${BASE_DIR}/.clawdbot -> ${STATE_DIR}"
  mv "${BASE_DIR}/.clawdbot" "${STATE_DIR}"
fi

if [ -d "${BASE_DIR}/.moltbot" ] && [ ! -d "${STATE_DIR}" ]; then
  log "renaming legacy state ${BASE_DIR}/.moltbot -> ${STATE_DIR}"
  mv "${BASE_DIR}/.moltbot" "${STATE_DIR}"
fi

if [ ! -f "${STATE_DIR}/openclaw.json" ]; then
  if [ -f "${STATE_DIR}/clawdbot.json" ]; then
    log "copying legacy config ${STATE_DIR}/clawdbot.json -> ${STATE_DIR}/openclaw.json"
    cp -a "${STATE_DIR}/clawdbot.json" "${STATE_DIR}/openclaw.json"
  elif [ -f "${STATE_DIR}/moltbot.json" ]; then
    log "copying legacy config ${STATE_DIR}/moltbot.json -> ${STATE_DIR}/openclaw.json"
    cp -a "${STATE_DIR}/moltbot.json" "${STATE_DIR}/openclaw.json"
  fi
fi

if [ ! -d "${REPO_DIR}" ]; then
  if [ -d "${BASE_DIR}/clawdbot-src" ]; then
    log "renaming legacy repo ${BASE_DIR}/clawdbot-src -> ${REPO_DIR}"
    mv "${BASE_DIR}/clawdbot-src" "${REPO_DIR}"
  elif [ -d "${BASE_DIR}/moltbot-src" ]; then
    log "renaming legacy repo ${BASE_DIR}/moltbot-src -> ${REPO_DIR}"
    mv "${BASE_DIR}/moltbot-src" "${REPO_DIR}"
  fi
fi
