Set up the standard project operational structure in the current working directory.

Follow the guide at `~/.claude/commands/project-operations-setup-guide.md` exactly. Read it first before doing anything.

Steps:
1. Ask the user for the project name (used in headings across all files).
2. Check which files and folders already exist in the current directory. For any that exist, flag them ("MEMORY.md already exists — skipping") and do not overwrite.
3. Create the missing files from the templates in the guide:
   - `DIRECTORY.md`
   - `MEMORY.md`
   - `PROGRESS TRACKER.md`
   - `Context Files/` folder
   - `Context Files/Current State.md`
4. Set up `CLAUDE.md`:
   - If it doesn't exist, create it fresh using the template in the guide (ask the user for a 1-2 sentence project description).
   - If it already exists, invoke the `claude-md-improver` skill (using the Skill tool) to audit the existing file first. Then propose adding the integration blocks (Memory & Progress, Project Directory, Context Files) to it. Show the proposed additions and wait for approval before editing.
5. After setup is complete, invoke the `claude-md-improver` skill (using the Skill tool) to audit the final CLAUDE.md and present any quality improvement suggestions to the user.
6. Show the user a summary of what was created, what was skipped, and what was added to CLAUDE.md.

$ARGUMENTS
