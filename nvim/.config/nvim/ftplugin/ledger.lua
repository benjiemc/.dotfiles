ledger_maxwidth = 120
ledger_fold_blanks = 1

function LedgerSort()
    vim.cmd [[
        :%! ledger -f - print --sort 'date, amount'
        :%LedgerAlign
    ]]
end
