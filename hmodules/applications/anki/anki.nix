{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ 
    anki 

    #make sure to run this 'anki-restore-backup' after fresh install
    (pkgs.writeShellScriptBin "anki-restore-backup" ''
      echo "=== Anki Backup Restoration Check ==="
      ANKI_COLLECTION="$HOME/.local/share/Anki2/User 1/collection.anki2"
      BACKUP="${./anki_backup/backup-2025-12-02-07.30.52.colpkg}"
      
      echo "Checking for: $ANKI_COLLECTION"
      echo "Backup file: $BACKUP"
      
      if [ ! -f "$ANKI_COLLECTION" ]; then
        echo "No Anki collection found."
        if [ -f "$BACKUP" ]; then
          echo "Backup file exists. Opening Anki..."
          ${pkgs.anki}/bin/anki "$BACKUP" &
        else
          echo "ERROR: Backup file not found at $BACKUP"
        fi
      else
        echo "Anki collection already exists. Skipping restore."
      fi
      echo "=== End Anki Check ==="
    '')
  ];
}
