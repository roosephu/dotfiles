# Add an existing file, directory, or symlink to the source state
export extern "chezmoi add" [
  ...targets: string                              # name of the branch or files to checkout
  --autotemplate(-a)                              # Generate the template when adding files as templates
  --create                                        # Add files that should exist, irrespective of their contents
  --empty(-e)                                     # Add empty files
  --encrypt                                       # Encrypt files
  --exact                                         # Add directories exactly
  --exclude(-e): string                           # Exclude entry types (default none)
  --follow(-f)                                   # Add symlink targets instead of symlinks
  --help(-h)                                      # help for add
  --include(-i): string                           # Include entry types (default all)
  --recursive(-r)                                 # Recurse into subdirectories (default true)
  --template(-T)                                  # Add files as templates
  --template-symlinks                             # Add symlinks with target in source or home dirs as templates
]
