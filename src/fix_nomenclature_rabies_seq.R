## Code to standardize the the different plate nomenclatures


library(Biostrings)

fasta_1 <- readBStringSet("data/fasta_files/Scifer_comb-sequences_batch1_old.fasta")

# Adjust well names for the format [A:H] + 01:12 
wells <- sub("_.*|-.*", "", names(fasta_1))
well_number <- sub("_","",gsub("[[:upper:]]","",wells))
well_letter <- sub("_","",gsub("[[:digit:]]","",wells))
wells_adj <- paste0(well_letter,sprintf("%02s", well_number))

# Get animal names
animals_ids <- paste0("I",sprintf("%02s", 1:18), collapse = "|")
m <- regexpr(animals_ids, names(fasta_1))
animals_ids_seqs <- regmatches(names(fasta_1), m)

# Extract and rename plate numbering
plates <- sapply(strsplit(names(fasta_1), split = "_|-"), "[", 2)

values_to_replace <- data.frame(old_names = c("P1", "P2", "Mixed1", "Mixed2", "Mixed3", "Mixed4", "I17"),
                       new_names = c("05", "06", "07", "08", "09", "10", "11"))
                      
plates_ids <- plyr::mapvalues(plates, from = values_to_replace$old_names, to = values_to_replace$new_names)

# Merge animal ID, Plate, and well name for concise nomenclature
fasta_new_names <- paste(animals_ids_seqs, plates_ids, wells_adj, "HC", sep = "_")
names(fasta_1) <- fasta_new_names
writeXStringSet(fasta_1, "data/fasta_files/Scifer_comb-sequences_batch1.fasta")

# Fix names from fredrika... "_HC" should be at the end not in the middle.
fasta_2 <- readBStringSet("data/fasta_files/Scifer_comb-sequences_batch2.fasta")
names(fasta_2) <- paste0(sub("_HC", "",names(fasta_2)), "_HC")
writeXStringSet(fasta_2,"data/fasta_files/Scifer_comb-sequences_batch2.fasta")

# Merge fasta files
merged <- c(fasta_1, fasta_2)
writeXStringSet(merged, "data/fasta_files/combined_sanger_seq.txt")

       