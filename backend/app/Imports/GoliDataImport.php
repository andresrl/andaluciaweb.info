<?php

namespace App\Imports;

use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;

class GoliDataImport implements ToCollection
{
    public function collection(Collection $rows)
    {
        return $rows;
    }
}