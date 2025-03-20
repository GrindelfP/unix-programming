USERNAME=$(whoami)

remove_ipcs() {
  local ipc_type="$1"
  local ipc_option="$2"
  local ipc_ids="$3"

  if [[ -n "$ipc_ids" ]]; then
    echo "Removing $ipc_type with IDs: $ipc_ids"
    for id in $ipc_ids; do
      ipcrm "$ipc_option" "$id"
    done
  else
    echo "No $ipc_type found belonging to $USERNAME."
  fi
}

sem_ids=$(ipcs -s | grep "$USERNAME" | awk '{print $2}')
msgq_ids=$(ipcs -q | grep "$USERNAME" | awk '{print $2}')
shm_ids=$(ipcs -m | grep "$USERNAME" | awk '{print $2}')

sem_ids_=$(echo $sem_ids | tr '\n' ' ')
msgq_ids_=$(echo $msgq_ids | tr '\n' ' ')
shm_ids_=$(echo $shm_ids | tr '\n' ' ')

echo "Found semaphores: $sem_ids_"
echo "Found message queues: $msgq_ids_"
echo "Found shared memory segments: $shm_ids_"

remove_ipcs "semaphores" "-s" "$sem_ids_"
remove_ipcs "message queues" "-q" "$msgq_ids_"
remove_ipcs "shared memory segments" "-m" "$shm_ids_"

