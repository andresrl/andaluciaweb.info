<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Meeting extends Model
{
    use HasFactory;

    protected $fillable = [
        'company_name',
        'company_tradename',
        'company_username',
        'company_email',
        'professional_fullname',
        'professional_company',
        'professional_email',
        'professional_sector',
    ];

}
