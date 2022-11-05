let g:ledger_maxwidth = 120
let g:ledger_fold_blanks = 1

function LedgerSort()
    :%! ledger -f - print --sort 'date, amount'
    :%LedgerAlign
endfunction

command LedgerSort call LedgerSort()
